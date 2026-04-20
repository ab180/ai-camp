---
name: day1-onboarding
description: AI Native Camp Day 1 온보딩. Claude Code 설치 + AI 시대의 변화 + 7개 핵심 기능 실습. "1일차", "Day 1", "온보딩", "시작" 요청에 사용.
---

# Day 1: AI 시대의 변화와 Claude Code

이 스킬이 호출되면 아래 **STOP PROTOCOL**을 반드시 따른다.

---

## 용어 정리

이 스킬에서 사용하는 핵심 용어:

| 용어 | 설명 |
|------|------|
| **Claude Code** | Anthropic의 공식 AI 코딩 어시스턴트 CLI. "터미널에서 AI와 대화하며 일하는 도구" |
| **CLAUDE.md** | Claude가 매 대화 시작할 때 읽는 규칙서. "AI의 영구 기억 = 팀 위키" |
| **Skill** | Claude에게 특정 작업 방법을 가르치는 문서. "레시피처럼 단계가 적힌 매뉴얼" |
| **MCP** | Model Context Protocol. Claude가 외부 서비스와 대화하는 표준 통로. "USB-C 포트" |
| **Subagent** | Claude가 다른 Claude를 불러서 일을 시키는 것. "팀장이 팀원에게 일 나눠주기" |
| **Hook** | 특정 이벤트 발생 시 자동 실행되는 스크립트. "파일 저장하면 자동 포맷팅" |
| **Plugin** | 외부에서 설치한 스킬 모음. "앱스토어에서 앱 설치하듯 스킬 패키지 설치" |
| **Allocation Economy** | "무엇을 시킬 것인가"가 생산성을 결정하는 경제. AI 시대의 핵심 역량 |

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
| 0 | 환경 확인 + 설치 | ~10분 |
| 1 | AI 시대의 변화 | ~10분 |
| 2 | Claude Code 첫 체험 | ~10분 |
| 3 | 7개 핵심 기능 (3-1 ~ 3-7) | ~25분 |
| 4 | CLI + git 기초 | ~10분 |
| **합계** | | **~65분** |

> Block 3이 가장 시간이 많이 걸리는 핵심 블록입니다. 7개 기능을 하나씩 체험합니다.

---

## 핵심 전략: 개념 이해 → 직접 체험

아래 방식으로 진행한다:

1. Block 0에서 Claude Code 설치 + 환경 확인
2. Block 1에서 AI 시대의 변화와 Allocation Economy 이해
3. Block 2에서 Claude Code로 파일 생성/수정을 직접 체험
4. Block 3에서 7개 핵심 기능을 하나씩 배우고 실습
5. Block 4에서 CLI 명령어와 git 기초를 익힌다

> 가장 중요한 것은 Block 3의 CLAUDE.md (3-1). 매 세션마다 로딩되는 "영구 기억"이 Claude Code 활용의 핵심이다.

---

## 블록 특수 규칙

- **Block 0 (환경 확인)**: QUIZ가 없다. Phase A만 진행하고, 완료 확인 후 다음 블록 안내.
- **Block 1 (핵심 개념)**: 이론 중심. EXECUTE가 없고 EXPLAIN + QUIZ만 진행.
- **Block 2 (첫 체험)**: QUIZ가 없다. Phase A에서 Claude Code로 hello.md 생성 실습 → Stop. 완료 확인 후 다음 블록.
- **Block 3 (7개 핵심 기능)**: 7개 서브 블록(3-1 ~ 3-7)으로 구성. 각 서브 블록마다 Phase A → Phase B를 따르되, 3-1(CLAUDE.md)이 가장 중요하므로 충분히 시간을 쓴다. QUIZ가 없는 서브 블록은 Phase A만 진행.
- **Block 4 (CLI + git)**: Phase A에서 5개 필수 명령어 실습 안내 → Stop. Phase B에서 퀴즈.

---

## References 파일 맵

| 블록 | 파일 | 주제 |
|------|------|------|
| Block 0 | `references/block0-setup.md` | 환경 확인 + 설치 |
| Block 1 | `references/block1-concepts.md` | AI 시대의 변화 + Allocation Economy |
| Block 2 | `references/block2-experience.md` | Claude Code 첫 체험 |
| Block 3-1 | `references/block3-1-claude-md.md` | CLAUDE.md — 영구 기억 |
| Block 3-2 | `references/block3-2-skill.md` | Skill — 반복 작업 레시피 |
| Block 3-3 | `references/block3-3-mcp.md` | MCP — 외부 도구 연결 |
| Block 3-4 | `references/block3-4-subagent.md` | Subagent — 일 나눠주기 |
| Block 3-5 | `references/block3-5-agent-teams.md` | Agent Teams — 팀 단위 분업 |
| Block 3-6 | `references/block3-6-hook.md` | Hook — 자동화 트리거 |
| Block 3-7 | `references/block3-7-plugin.md` | Plugin — 스킬 패키지 설치 |
| Block 4 | `references/block4-cli-git.md` | CLI 명령어 + git 기초 |

> 파일 경로는 이 SKILL.md 기준 상대경로다.
> 각 reference 파일은 `## EXPLAIN`, `## EXECUTE`, `## QUIZ` 섹션으로 구성된다.

---

## 진행 규칙

- 한 번에 한 블록씩 진행한다
- "다음", "skip", 블록 번호/이름으로 이동한다
- 각 블록 시작 시 진행 상태를 표시한다: `📍 Day 1 진행: [Block N/4] — 블록 제목`
- 모든 응답은 **한국어**로 한다
- Claude Code 관련 질문이 오면 claude-code-guide 에이전트(내장 도구)로 답변한다. 답변 후 사용자가 직접 따라할 수 있게 단계별로 안내하고, 질문할 때는 AskUserQuestion을 사용한다. 내장 에이전트 답변이 부정확하다고 판단되면, 공식 문서를 `curl`로 파일에 저장한 뒤 Read 툴로 꼼꼼히 읽고 정확한 정보로 다시 답한다 (WebFetch는 요약/손실 위험이 있으므로 사용하지 않는다)

---

## 시작

스킬 시작 시 아래 테이블을 보여주고 AskUserQuestion으로 어디서 시작할지 물어본다.

| Block | 주제 | 내용 |
|-------|------|------|
| 0 | 환경 확인 | Claude Code 설치 + 에디터 설정 |
| 1 | 핵심 개념 | AI 시대의 변화, Allocation Economy |
| 2 | 첫 체험 | Claude Code로 파일 만들어보기 |
| 3 | 7개 핵심 기능 | CLAUDE.md, Skill, MCP, Subagent, Agent Teams, Hook, Plugin |
| 4 | CLI + git | 터미널 명령어 5개 + git 기초 |

```json
AskUserQuestion({
  "questions": [{
    "question": "Day 1: AI 시대의 변화와 Claude Code\n\n어디서부터 시작할까요?",
    "header": "시작 블록",
    "options": [
      {"label": "처음부터 (Block 0)", "description": "설치와 환경 확인부터 차근차근 (추천)"},
      {"label": "핵심 개념 (Block 1)", "description": "AI 시대의 변화부터"},
      {"label": "7개 핵심 기능 (Block 3)", "description": "CLAUDE.md, Skill, MCP 등 바로 시작"},
      {"label": "CLI + git (Block 4)", "description": "터미널과 버전 관리부터"}
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
| 지식노동자의 변화 | 대체가 아니라 **증폭** (곱셈) |
| Allocation Economy | "무엇을 시킬 것인가"가 생산성 |
| 새로운 핵심 역량 | 맥락 정의, 판단 기준 설정, 결과 검증 |
| 7개 핵심 기능 | CLAUDE.md가 가장 중요 (항상 로딩되는 영구 기억) |
| CLI + git | 5개 명령어 + 실행 취소의 끝판왕 |

### 산출물
- CLAUDE.md 초안
- Claude Code 환경 확인 완료
- hello.md 체험 파일

### 다음 시간 예고
**Day 2: 맥락 연결하기** — MCP로 외부 도구를 연결하고, Context Sync 스킬을 만듭니다.

> Day 1 완료를 축하합니다! Day 2를 시작하려면 `/day2` 를 입력하세요.
