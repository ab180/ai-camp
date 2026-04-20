---
name: day2-context
description: AI Native Camp Day 2 맥락 연결하기. MCP로 외부 도구를 연결하고 Context Sync 스킬을 만든다. "2일차", "Day 2", "MCP", "Context Sync", "맥락" 요청에 사용.
---

# Day 2: 맥락 연결하기 — MCP와 Context Sync

이 스킬이 호출되면 아래 **STOP PROTOCOL**을 반드시 따른다.

---

## 용어 정리

이 스킬에서 사용하는 핵심 용어:

| 용어 | 설명 |
|------|------|
| **맥락(Context)** | AI가 좋은 답변을 하기 위해 필요한 배경 정보. "같은 AI인데 결과가 다른 이유 = 맥락의 유무" |
| **MCP** | Model Context Protocol. Claude가 외부 서비스(Slack, Gmail 등)와 대화하는 표준 통로. "USB-C 포트" |
| **MCP 서버** | MCP 프로토콜을 구현한 외부 연결 프로그램. "USB-C 케이블의 어댑터" |
| **Context Sync** | 여러 도구에서 맥락을 한꺼번에 수집하는 스킬. "아침에 '싱크해줘' 한마디로 모든 정보 수집" |
| **Subagent** | Claude가 다른 Claude를 불러서 일을 시키는 것. "여러 도구를 동시에 수집할 때 활용" |
| **API** | 프로그램끼리 대화하는 창구. "MCP가 없을 때 직접 데이터를 가져오는 방법" |
| **JSON** | 컴퓨터가 읽기 좋은 데이터 형식. 중괄호 투성이지만 Claude는 완벽히 이해한다 |

---

## STOP PROTOCOL — 절대 위반 금지

> 이 프로토콜은 이 스킬의 최우선 규칙이다.
> 아래 규칙을 위반하면 수업이 망가진다.

### 각 블록은 반드시 2턴에 걸쳐 진행한다

```
┌─ Phase A (첫 번째 턴) ──────────────────────────────┐
│ 1. references/에서 해당 블록 파일의 EXPLAIN 섹션을 읽는다    │
│ 2. 기능을 설명한다                                        │
│ 3. references/에서 해당 블록 파일의 EXECUTE 섹션을 읽는다    │
│ 4. "지금 직접 실행해보세요"라고 안내한다                     │
│ 5. ⛔ 여기서 반드시 STOP. 턴을 종료한다.                    │
│                                                          │
│ ❌ 절대 하지 않는 것: 퀴즈 출제, QUIZ 섹션 읽기             │
│ ❌ 절대 하지 않는 것: AskUserQuestion 호출                  │
│ ❌ 절대 하지 않는 것: "실행해봤나요?" 질문                   │
└──────────────────────────────────────────────────────────┘

  ⬇️ 사용자가 돌아와서 "했어", "완료", "다음" 등을 입력한다

┌─ Phase B (두 번째 턴) ──────────────────────────────┐
│ 1. references/에서 해당 블록 파일의 QUIZ 섹션을 읽는다       │
│ 2. AskUserQuestion으로 퀴즈를 출제한다                     │
│ 3. 정답/오답 피드백을 준다                                 │
│ 4. 다음 블록으로 이동할지 AskUserQuestion으로 묻는다         │
│ 5. ⛔ 다음 블록을 시작하면 다시 Phase A부터.                │
└──────────────────────────────────────────────────────────┘
```

### 핵심 금지 사항 (절대 위반 금지)

1. **Phase A에서 AskUserQuestion을 호출하지 않는다** — 설명 + 실행 안내 후 바로 Stop
2. **Phase A에서 퀴즈를 내지 않는다** — QUIZ 섹션은 Phase B에서만 읽는다
3. **Phase A에서 "실행해봤나요?"를 묻지 않는다** — 사용자가 먼저 말할 때까지 기다린다
4. **한 턴에 EXPLAIN + QUIZ를 동시에 하지 않는다** — 반드시 2턴으로 나눈다

### 공식 문서 URL 출력 (절대 누락 금지)

모든 블록의 Phase A 시작 시, 해당 reference 파일 상단의 `> 공식 문서:` URL을 **반드시 그대로 출력**한다.

```
📖 공식 문서: [URL]
```

- reference 파일에 URL이 여러 개 있으면 전부 출력한다
- URL을 요약하거나 생략하지 않는다

### Phase A 종료 시 필수 문구

Phase A의 마지막에는 반드시 아래 형태의 문구를 출력하고 Stop한다:

```
---
👆 위 내용을 직접 실행해보세요.
실행이 끝나면 "완료" 또는 "다음"이라고 입력해주세요.
```

이 문구 이후에 어떤 도구 호출(AskUserQuestion 포함)이나 추가 텍스트도 출력하지 않는다.

---

## 소요 시간 가이드

| Block | 주제 | 예상 시간 |
|-------|------|-----------|
| 0 | 맥락의 중요성 | ~10분 |
| 1 | 도구별 설계 철학 | ~10분 |
| 2 | MCP 딥다이브 | ~15분 |
| 3 | MCP 실습 | ~20분 |
| 4 | Context Sync 스킬 구축 | ~20분 |
| **합계** | | **~75분** |

> Block 3(MCP 실습)과 Block 4(Context Sync)가 핵심 블록입니다. MCP 연결이 잘 안 되면 개념 이해만으로도 충분합니다.

---

## 핵심 전략: 개념 이해 → MCP 연결 → 스킬 구축

아래 방식으로 진행한다:

1. Block 0에서 "같은 AI, 다른 결과"의 비밀 — 맥락의 유무를 이해한다
2. Block 1에서 Slack, Gmail, Notion 등 도구별 데이터 구조를 파악한다
3. Block 2에서 MCP의 작동 원리와 연결 방법을 배운다
4. Block 3에서 실제로 MCP 서버를 설치하고 연결한다
5. Block 4에서 Context Sync 스킬을 직접 만든다

> Day 1에서 CLAUDE.md로 "내부 맥락"을 설계했다면, Day 2에서는 MCP로 "외부 맥락"을 연결한다.

---

## 블록 특수 규칙

- **Block 0 (맥락의 중요성)**: QUIZ가 없다. Phase A에서 Before/After 예시로 맥락의 중요성 설명 → Stop. 완료 확인 후 다음 블록.
- **Block 1 (도구별 설계 철학)**: 이론 중심. 각 도구(Slack, Gmail, Notion 등)의 데이터 구조 분석 → Stop. Phase B에서 퀴즈.
- **Block 2 (MCP 딥다이브)**: MCP 연결 방법 3가지 설명 → Stop. Phase B에서 퀴즈.
- **Block 3 (MCP 실습)**: QUIZ가 없다. Phase A에서 실제 MCP 서버 설치 + 연결 안내 → Stop. 완료 확인 후 다음 블록. (연결 실패해도 괜찮다고 격려)
- **Block 4 (Context Sync)**: Phase A에서 Context Sync 스킬 구조 설명 + 참가자가 직접 작성하도록 안내 → Stop. Phase B에서 퀴즈.

---

## References 파일 맵

| 블록 | 파일 | 주제 |
|------|------|------|
| Block 0 | `references/block0-context-importance.md` | 같은 AI + 다른 맥락 = 다른 결과 |
| Block 1 | `references/block1-tool-philosophy.md` | Slack, Gmail, Notion 등 도구별 설계 철학 |
| Block 2 | `references/block2-mcp-deepdive.md` | MCP 작동 원리 + 연결 방법 3가지 |
| Block 3 | `references/block3-mcp-practice.md` | MCP 서버 설치 + 연결 실습 |
| Block 4 | `references/block4-context-sync.md` | Context Sync 스킬 직접 만들기 |

> 파일 경로는 이 SKILL.md 기준 상대경로다.
> 각 reference 파일은 `## EXPLAIN`, `## EXECUTE`, `## QUIZ` 섹션으로 구성된다.

---

## 진행 규칙

- 한 번에 한 블록씩 진행한다
- "다음", "skip", 블록 번호/이름으로 이동한다
- 각 블록 시작 시 진행 상태를 표시한다: `📍 Day 2 진행: [Block N/4] — 블록 제목`
- 모든 응답은 **한국어**로 한다
- Claude Code 관련 질문이 오면 claude-code-guide 에이전트(내장 도구)로 답변한다. 답변 후 사용자가 직접 따라할 수 있게 단계별로 안내하고, 질문할 때는 AskUserQuestion을 사용한다. 내장 에이전트 답변이 부정확하다고 판단되면, 공식 문서를 `curl`로 파일에 저장한 뒤 Read 툴로 꼼꼼히 읽고 정확한 정보로 다시 답한다 (WebFetch는 요약/손실 위험이 있으므로 사용하지 않는다)

---

## 시작

스킬 시작 시 아래 테이블을 보여주고 AskUserQuestion으로 어디서 시작할지 물어본다.

| Block | 주제 | 내용 |
|-------|------|------|
| 0 | 맥락의 중요성 | 같은 AI, 다른 결과의 비밀 |
| 1 | 도구별 설계 철학 | Slack, Gmail, Notion 등의 구조 |
| 2 | MCP 딥다이브 | MCP 작동 원리와 연결 방법 |
| 3 | MCP 실습 | 직접 MCP 연결하기 |
| 4 | Context Sync | 여러 도구 맥락을 하나로 수집하는 스킬 만들기 |

```json
AskUserQuestion({
  "questions": [{
    "question": "Day 2: 맥락 연결하기 — MCP와 Context Sync\n\n어디서부터 시작할까요?",
    "header": "시작 블록",
    "options": [
      {"label": "처음부터 (Block 0)", "description": "맥락의 중요성부터 차근차근 (추천)"},
      {"label": "MCP 딥다이브 (Block 2)", "description": "MCP 개념부터 바로 시작"},
      {"label": "MCP 실습 (Block 3)", "description": "MCP 연결 실습부터"},
      {"label": "Context Sync (Block 4)", "description": "스킬 구축부터"}
    ],
    "multiSelect": false
  }]
})
```

> 시작 블록 선택 후 → 해당 블록의 Phase A부터 진행한다.

---

## 마무리

모든 블록 완료 후 아래를 보여준다:

### 오늘 배운 것 정리

| 개념 | 핵심 |
|------|------|
| 맥락의 중요성 | 같은 AI + 다른 맥락 = 다른 결과 |
| 도구별 설계 철학 | 각 도구의 데이터 구조를 이해하면 AI 활용도 상승 |
| MCP | USB-C 포트처럼 하나의 표준으로 여러 도구 연결 |
| Context Sync | "싱크해줘" 한마디로 여러 도구 맥락을 하나로 |
| Subagent | 병렬 수집으로 시간 절약 |

### 산출물
- MCP 연결 1개 이상 (또는 개념 이해)
- Context Sync 스킬 골격

### 다음 시간 예고
**Day 3: 스킬 설계와 제작** — Clarify 프로세스로 모호함을 제거하고, 나만의 스킬을 직접 만듭니다.

> Day 2 완료를 축하합니다! Day 3을 시작하려면 `/day3` 를 입력하세요.
