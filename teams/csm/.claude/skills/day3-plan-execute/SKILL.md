---
name: day3-plan-execute
description: AI Camp 3기 CSM Day 3 자가학습용 인터랙티브 스킬. 암묵지 끌어내기 + Clarify + Deep Interview + SKILL.md 다듬기 + 두 번째 PR. "3일차", "Day 3", "스킬 다듬기", "Clarify", "암묵지" 요청에 사용.
---

# Day 3: 스킬 다듬기 — 암묵지를 명시지로, Claude Code와 대화하며

이 스킬이 호출되면 아래 **STOP PROTOCOL**을 반드시 따른다.

---

## 용어 정리

이 스킬에서 사용하는 핵심 용어:

| 용어 | 설명 |
|------|------|
| **암묵지** | 머릿속엔 있는데 SKILL.md엔 안 적힌 것. "말로 하면 당연한데 글로 쓰면 빠지는 것" |
| **명시지** | 텍스트로 명확히 적힌 것. AI가 실제로 읽고 따를 수 있는 상태 |
| **Clarify** | 실행 전에 "무엇을·누구를 위해·어떤 모양"을 명확히 하는 단계 |
| **Deep Interview** | Clarify를 구조화한 스킬. 독자·입력·출력·성공 기준 4가지를 체계적으로 끌어냄 |
| **대화하며 다듬기** | Claude Code와 말로 주고받으면서 수정 — 혼자 Edit하지 않는다 |
| **두 번째 PR** | 어제 repo에 오늘 보강된 SKILL.md를 올리는 PR. git log에 2개 commit |
| **Subagent** | 메인 AI가 독립된 AI를 병렬로 여러 개 띄워 동시에 작업시키는 것 |

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
| B0 | 어제 결과 짚기 — 빠진 암묵지 이름 붙이기 | ~15분 |
| B1 | Clarify + Deep Interview로 암묵지 끌어내기 | ~30분 |
| B2 | SKILL.md 다듬기 + 두 번째 PR | ~60분 |
| B3 | Subagent 개념 (가볍게) | ~15분 |
| **합계** | | **~120분** |

> B2(SKILL.md 다듬기)가 핵심 블록입니다. Claude Code와 **대화하며** 다듬습니다 — 혼자 Edit하지 않습니다.

---

## 블록 특수 규칙

- **Block B0 (어제 결과 짚기)**: QUIZ가 없다. Phase A에서 어제 빠진 부분 3가지 관점(반복·구체성·내 손) 설명 + 짝꿍 공유 안내 → Stop. 완료 확인 후 B1.
- **Block B1 (Clarify + Deep Interview)**: Phase A에서 Clarify 개념 + Deep Interview 스킬 설명 + 실습(문제 고르기 → 호출 → 스펙 받기) 안내 → Stop. Phase B에서 퀴즈.
- **Block B2 (SKILL.md 다듬기 + PR)**: QUIZ가 없다. 4단계 흐름(단서+SKILL.md 나란히 → 대화하며 다듬기 → 검토+한 번 호출 → 두 번째 PR) 안내 → Stop. 완료 확인 후 B3.
- **Block B3 (Subagent 가볍게)**: Phase A에서 Subagent 개념 + 주의점 3가지 + 예제 1개 안내 → Stop. Phase B에서 퀴즈.

---

## References 파일 맵

| 블록 | 파일 | 주제 |
|------|------|------|
| B0 | `references/block-b0-implicit-knowledge.md` | 어제 결과 짚기 — 빠진 암묵지 이름 붙이기 |
| B1 | `references/block-b1-clarify-deep-interview.md` | Clarify + Deep Interview 실습 |
| B2 | `references/block-b2-skill-refine-pr.md` | SKILL.md 다듬기 (대화하며) + 두 번째 PR |
| B3 | `references/block-b3-subagent.md` | Subagent 개념 + 주의점 + 예제 |

---

## 진행 규칙

- 한 번에 한 블록씩 진행한다
- "다음", "skip", 블록 이름으로 이동한다
- 각 블록 시작 시 진행 상태를 표시한다: `📍 Day 3 진행: [Block B{N}] — 블록 제목`
- 모든 응답은 **한국어**로 한다
- **중요**: "혼자 Edit하지 말고 Claude Code와 대화하며 다듬기"를 B2에서 반드시 강조한다

---

## 시작

스킬 시작 시 아래 테이블을 보여주고 AskUserQuestion으로 어디서 시작할지 물어본다.

| Block | 주제 | 내용 |
|-------|------|------|
| B0 | 어제 결과 짚기 | 빠진 부분에 이름 붙이기 — 반복·구체성·내 손 |
| B1 | Clarify + Deep Interview | 암묵지를 명시지로 끌어내기 |
| B2 | SKILL.md 다듬기 + PR | Claude Code와 대화하며 + 두 번째 PR |
| B3 | Subagent | 병렬 호출 개념 + 주의점 (가볍게) |

```json
AskUserQuestion({
  "questions": [{
    "question": "Day 3: 스킬 다듬기 — 암묵지를 명시지로\n\n어디서부터 시작할까요?",
    "header": "시작 블록",
    "options": [
      {"label": "처음부터 (B0)", "description": "어제 결과 짚기부터 차근차근 (추천)"},
      {"label": "Clarify (B1)", "description": "Deep Interview로 암묵지 끌어내기"},
      {"label": "SKILL.md 다듬기 (B2)", "description": "바로 다듬기 + 두 번째 PR"},
      {"label": "Subagent (B3)", "description": "병렬 처리 개념부터"}
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
| 암묵지 | 머릿속엔 있는데 SKILL.md엔 안 적힌 것 |
| Clarify | 실행 전에 독자·입력·출력·성공 기준을 명확히 |
| Deep Interview | Clarify를 구조화한 스킬 — 4가지를 체계적으로 끌어냄 |
| 대화하며 다듬기 | 혼자 Edit 금지 — Claude Code와 말로 주고받으며 수정 |
| 두 번째 PR | git log에 2개 commit = 어제 vs 오늘 암묵지 변화량 |
| Subagent | 독립 작업자 2개+ 병렬 호출 — 시간 절약 |

### 오늘의 산출물
- 보강된 SKILL.md (암묵지 추가)
- 두 번째 PR (어제 짝꿍이 리뷰어)

### 내일 준비물
**Day 4: 검증 + 개선** — Generator vs Evaluator + Compound 사이클 + 팀 repo PR.

> Day 3 완료를 축하합니다! Day 4를 시작하려면 `/day4-validate-improve` 를 입력하세요.
