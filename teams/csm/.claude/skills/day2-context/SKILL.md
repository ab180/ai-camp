---
name: day2-context
description: AI Camp 3기 CSM Day 2 자가학습용 인터랙티브 스킬. MCP로 맥락 확장 + Context Sync + 스킬 첫 제작 + Git 기초. "2일차", "Day 2", "MCP", "맥락 연결", "Context Sync" 요청에 사용.
---

# Day 2: MCP로 맥락 확장하기 — 외부 도구 연결 + 스킬 첫 제작

이 스킬이 호출되면 아래 **STOP PROTOCOL**을 반드시 따른다.

---

## 용어 정리

이 스킬에서 사용하는 핵심 용어:

| 용어 | 설명 |
|------|------|
| **맥락(Context)** | AI가 좋은 답변을 하기 위해 필요한 배경 정보. "같은 AI인데 결과가 다른 이유 = 맥락의 유무" |
| **MCP** | Model Context Protocol. AI와 외부 도구를 잇는 표준 포트. "USB-C처럼 하나의 규격으로 연결" |
| **CSM 도구 6개** | Salesforce·Plain·Notion·Gmail·Sheets·Slack — 합쳐야 고객이 보인다 |
| **Context Sync** | 여러 MCP가 한 질문을 병렬로 읽고 합친 답을 주는 사용 방식 |
| **4 Step 분해** | 통째로 시키면 스킬이 안 나온다 → 입출력이 명확한 단계로 쪼개기 |
| **스킬 스펙** | 스킬 이름·언제 쓰나·입력·출력·사용 MCP 5줄로 정리한 설계도 |
| **PR (Pull Request)** | 내 변경을 팀 repo에 합쳐달라는 요청. "검토 후 반영해주세요" |
| **git commit** | 변경사항을 스냅샷으로 박제. "메시지 달린 저장" |

---

## STOP PROTOCOL — 절대 위반 금지

> 이 프로토콜은 이 스킬의 최우선 규칙이다.
> 아래 규칙을 위반하면 수업이 망가진다.

### 각 블록은 반드시 2턴에 걸쳐 진행한다

```
┌─ Phase A (첫 번째 턴) ──────────────────────────────┐
│ 1. references/에서 해당 블록 파일의 EXPLAIN 섹션을 읽는다    │
│ 2. 내용을 설명한다                                        │
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

모든 블록의 Phase A 시작 시, 해당 reference 파일 상단의 URL을 **반드시 그대로 출력**한다.

```
📖 공식 문서: [URL]
```

### Phase A 종료 시 필수 문구

```
---
👆 위 내용을 직접 실행해보세요.
실행이 끝나면 "완료" 또는 "다음"이라고 입력해주세요.
```

---

## 소요 시간 가이드

| Block | 주제 | 예상 시간 |
|-------|------|-----------|
| B1 | 맥락 없음 vs 있음 비교 | ~15분 |
| B2 | MCP 개념 + CSM 도구 6개 | ~20분 |
| B3 | MCP 연결 실습 + Context Sync | ~25분 |
| B4 | 스킬 첫 제작 (4 Step → 스펙 → 생성) | ~30분 |
| B5 | Git + repo + PR | ~20분 |
| **합계** | | **~110분** |

> B3에서 MCP 연결이 잘 안 되어도 괜찮습니다. 개념 이해만으로 B4(스킬 제작)로 넘어갈 수 있습니다.

---

## 블록 특수 규칙

- **Block B1 (맥락 없음 vs 있음)**: QUIZ가 없다. Phase A에서 before/after 비교 → Stop. 완료 확인 후 다음 블록.
- **Block B2 (MCP 개념 + 도구 6개)**: Phase A에서 MCP 정의·USB-C 비유·CSM 도구 6개 설명 → Stop. Phase B에서 퀴즈.
- **Block B3 (MCP 연결 + Context Sync)**: QUIZ가 없다. Phase A에서 MCP 연결 실습 + Context Sync 안내 → Stop. 연결 실패해도 괜찮다고 격려.
- **Block B4 (스킬 첫 제작)**: Phase A에서 4 Step 분해 → 스펙 5줄 → 생성 안내 → Stop. Phase B에서 퀴즈.
- **Block B5 (Git + repo + PR)**: QUIZ가 없다. Phase A에서 5개 명령어 + repo + PR 흐름 안내 → Stop.

---

## References 파일 맵

| 블록 | 파일 | 주제 |
|------|------|------|
| B1 | `references/block-b1-context-compare.md` | 맥락 없음 vs 있음 — 같은 프롬프트 결과 비교 |
| B2 | `references/block-b2-mcp-tools.md` | MCP 개념 + USB-C 비유 + CSM 도구 6개 |
| B3 | `references/block-b3-mcp-practice.md` | MCP 연결 실습 + Context Sync |
| B4 | `references/block-b4-skill-creation.md` | 스킬 첫 제작 (4 Step → 스펙 → SKILL.md 생성) |
| B5 | `references/block-b5-git-repo-pr.md` | Git 5개 명령어 + 내 repo + 첫 PR |

---

## 진행 규칙

- 한 번에 한 블록씩 진행한다
- "다음", "skip", 블록 이름으로 이동한다
- 각 블록 시작 시 진행 상태를 표시한다: `📍 Day 2 진행: [Block B{N}] — 블록 제목`
- 모든 응답은 **한국어**로 한다

---

## 시작

스킬 시작 시 아래 테이블을 보여주고 AskUserQuestion으로 어디서 시작할지 물어본다.

| Block | 주제 | 내용 |
|-------|------|------|
| B1 | 맥락 비교 | 같은 프롬프트 + 맥락 없음/있음 결과 직접 비교 |
| B2 | MCP 개념 | USB-C 비유 + CSM 도구 6개 지형도 |
| B3 | MCP 실습 | 실제 연결 + Context Sync 통합 수집 |
| B4 | 스킬 제작 | 4 Step 분해 → 스펙 → Claude가 SKILL.md 생성 |
| B5 | Git + repo | 5개 명령어 + 내 repo + 첫 PR |

```json
AskUserQuestion({
  "questions": [{
    "question": "Day 2: MCP로 맥락 확장하기\n\n어디서부터 시작할까요?",
    "header": "시작 블록",
    "options": [
      {"label": "처음부터 (B1)", "description": "맥락 있음/없음 비교부터 차근차근 (추천)"},
      {"label": "MCP 개념 (B2)", "description": "MCP 정의 + 도구 6개부터"},
      {"label": "MCP 실습 (B3)", "description": "바로 MCP 연결 실습"},
      {"label": "스킬 제작 (B4)", "description": "4 Step 분해 + 스킬 생성부터"},
      {"label": "Git + repo (B5)", "description": "버전 관리 + PR부터"}
    ],
    "multiSelect": false
  }]
})
```

---

## 마무리

모든 블록 완료 후 아래를 보여준다:

### 오늘 배운 것 정리

| 개념 | 핵심 |
|------|------|
| 맥락의 힘 | 같은 AI + 다른 맥락 = 완전히 다른 결과 |
| MCP | USB-C처럼 하나의 규격으로 여러 도구 연결 |
| CSM 도구 6개 | 합쳐야 고객이 보인다 — 한 도구만 보면 절반 |
| Context Sync | SFDC+Notion+Slack을 한 요청에 자동 결합 |
| 스킬 제작 | 4 Step 분해 → 스펙 5줄 → SKILL.md 자동 생성 |
| Git 5개 | clone / pull / commit / push / PR |

### 오늘의 산출물
- MCP 연결 1개 이상 (또는 개념 이해)
- SKILL.md 첫 버전
- 내 GitHub repo + 첫 PR

### 오늘 밤 과제 2가지
1. PR 1개 만들기 (오늘 만든 스킬 commit → push → PR 생성)
2. 짝꿍을 리뷰어로 지정하기

### 내일 준비물
**Day 3: 스킬 다듬기** — Clarify + Deep Interview로 어제 빠진 암묵지를 꺼냅니다.

> Day 2 완료를 축하합니다! Day 3를 시작하려면 `/day3-plan-execute` 를 입력하세요.
