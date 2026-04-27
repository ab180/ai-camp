---
name: day1-structure-context
description: AI Camp 3기 CSM Day 1 자가학습용 인터랙티브 스킬. CLAUDE.md = Context Design. "1일차", "Day 1", "클로드md", "CLAUDE.md", "CSM 맥락 구조화" 요청에 사용.
---

# Day 1: 내 CSM 맥락을 구조화하기 — CLAUDE.md = Context Design

이 스킬이 호출되면 아래 **STOP PROTOCOL**을 반드시 따른다.

---

## 용어 정리

이 스킬에서 사용하는 핵심 용어:

| 용어 | 설명 |
|------|------|
| **CLAUDE.md** | Claude Code가 세션 시작마다 자동으로 읽는 고정 문서. "AI에게 주는 온보딩 문서" |
| **/init** | Claude Code 명령어. 현재 repo를 분석해 CLAUDE.md 초안을 자동 생성 |
| **6개 섹션** | 오늘 채울 CLAUDE.md 뼈대: 우리 팀 / 담당 고객 / 톤앤매너 / 금지어 / 워크플로우 / 도구 |
| **복리 효과** | 한 번 설정하면 이후 모든 대화가 기본값 위에서 시작 — 반복 설명이 사라짐 |
| **구조 (축 1)** | AI가 내 업무를 이해할 뼈대. 변하지 않는 고정 정보 (팀·톤·금지어) |
| **맥락 (축 2)** | 실시간으로 변하는 정보. MCP로 연결 (Day 2에서 다룸) |
| **Best Practices** | 1기·2기 경험 + Anthropic 공식 가이드에서 추린 좋은 CLAUDE.md 5가지 원칙 |
| **피해야 할 패턴** | 500줄+·변하는 정보 담기·이유 없는 금지어·개인+팀 섞기·안 쓰는 규칙 누적 |

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
| B1 | 왜 써야 하나 — CSM 과부하 구조 | ~15분 |
| B2 | Claude Code 첫 체험 — /init으로 초안 | ~15분 |
| B3 | CLAUDE.md 6섹션 채우기 | ~35분 |
| B4 | before/after 대조 체험 | ~10분 |
| B5 | 7개 기능 지형도 + Best Practices | ~25분 |
| **합계** | | **~100분** |

> B3(CLAUDE.md 6섹션 채우기)이 가장 핵심 블록입니다. 오늘의 산출물이 여기서 나옵니다.

---

## 블록 특수 규칙

- **Block B1 (왜 써야 하나)**: EXECUTE가 없다. EXPLAIN + QUIZ만 진행.
- **Block B2 (첫 체험)**: QUIZ가 없다. Phase A에서 /init 실행 안내 → Stop. 완료 확인 후 다음 블록.
- **Block B3 (6섹션 채우기)**: Phase A에서 6섹션 구조 설명 + 30분 개인 작성 안내 → Stop. Phase B에서 퀴즈.
- **Block B4 (before/after)**: QUIZ가 없다. Phase A에서 비교 체험 안내 → Stop. 완료 확인 후 다음 블록.
- **Block B5 (7개 기능 + Best Practices)**: 두 파트로 나뉜다. B5-1(7개 기능 지형도)과 B5-2(Best Practices). 각각 Phase A → Phase B 진행.

---

## References 파일 맵

| 블록 | 파일 | 주제 |
|------|------|------|
| B1 | `references/block-b1-why.md` | CSM 과부하 구조 + KTX vs 택시 비유 |
| B2 | `references/block-b2-init.md` | /init으로 CLAUDE.md 초안 자동 생성 |
| B3 | `references/block-b3-six-sections.md` | CLAUDE.md 6섹션 채우기 실습 |
| B4 | `references/block-b4-before-after.md` | CLAUDE.md 있/없 before-after 비교 |
| B5-1 | `references/block-b5-1-features.md` | 7개 기능 지형도 한눈에 |
| B5-2 | `references/block-b5-2-best-practices.md` | 좋은 CLAUDE.md 5원칙 + 피해야 할 패턴 |

> 파일 경로는 이 SKILL.md 기준 상대경로다.
> 각 reference 파일은 `## EXPLAIN`, `## EXECUTE`, `## QUIZ` 섹션으로 구성된다.

---

## 진행 규칙

- 한 번에 한 블록씩 진행한다
- "다음", "skip", 블록 이름으로 이동한다
- 각 블록 시작 시 진행 상태를 표시한다: `📍 Day 1 진행: [Block B{N}] — 블록 제목`
- 모든 응답은 **한국어**로 한다
- Claude Code 관련 질문이 오면 공식 문서를 `curl`로 파일에 저장한 뒤 Read 툴로 꼼꼼히 읽고 정확한 정보로 답한다

---

## 시작

스킬 시작 시 아래 테이블을 보여주고 AskUserQuestion으로 어디서 시작할지 물어본다.

| Block | 주제 | 내용 |
|-------|------|------|
| B1 | 왜 써야 하나 | CSM 과부하 구조 — 15×3=45개 상태 |
| B2 | 첫 체험 | /init으로 CLAUDE.md 초안 자동 생성 |
| B3 | 6섹션 채우기 | 우리 팀 / 담당 고객 / 톤앤매너 / 금지어 / 워크플로우 / 도구 |
| B4 | before/after | CLAUDE.md 있/없 결과 직접 비교 |
| B5 | 기능 + 원칙 | 7개 기능 지형도 + Best Practices |

```json
AskUserQuestion({
  "questions": [{
    "question": "Day 1: 내 CSM 맥락을 구조화하기\n\n어디서부터 시작할까요?",
    "header": "시작 블록",
    "options": [
      {"label": "처음부터 (B1)", "description": "왜 써야 하는지 CSM 과부하 구조부터 (추천)"},
      {"label": "첫 체험 (B2)", "description": "/init으로 초안 자동 생성부터"},
      {"label": "6섹션 채우기 (B3)", "description": "바로 CLAUDE.md 작성 실습"},
      {"label": "7개 기능 + 원칙 (B5)", "description": "전체 기능 지형도 + Best Practices"}
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
| CSM 과부하 구조 | 15고객 × 3스레드 = 45개 상태를 혼자 유지 |
| CLAUDE.md | AI가 세션마다 자동으로 읽는 온보딩 문서 |
| /init | 0에서 시작하지 않는다 — 초안을 먼저 받고 고친다 |
| 6섹션 | 팀·담당 고객·톤앤매너·금지어·워크플로우·도구 |
| 복리 효과 | 한 번 설정하면 이후 모든 대화가 기본값 위에서 시작 |
| 피해야 할 패턴 | 500줄+·변하는 정보·이유 없는 금지어·개인+팀 섞기 |

### 오늘의 산출물
- CLAUDE.md 초안 (6섹션)

### 내일 준비물
**Day 2: MCP로 맥락 확장** — Salesforce·Notion·Slack을 AI가 직접 읽게 연결합니다.

> Day 1 완료를 축하합니다! Day 2를 시작하려면 `/day2-context` 를 입력하세요.
