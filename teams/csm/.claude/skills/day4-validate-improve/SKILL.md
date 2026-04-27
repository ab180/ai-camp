---
name: day4-validate-improve
description: AI Camp 3기 CSM Day 4 자가학습용 인터랙티브 스킬. Generator vs Evaluator + 까다로운 고객 검증 + Compound 사이클 + 6축 자가진단 + 팀 repo PR. "4일차", "Day 4", "검증", "Compound", "팀 repo" 요청에 사용.
---

# Day 4: 검증하고 개선하기 — Generator vs Evaluator + Compound 사이클

이 스킬이 호출되면 아래 **STOP PROTOCOL**을 반드시 따른다.

---

## 용어 정리

이 스킬에서 사용하는 핵심 용어:

| 용어 | 설명 |
|------|------|
| **Generator** | 결과를 만드는 쪽. 내 스킬이 만든 초안 |
| **Evaluator** | 결과를 점검하는 쪽. 별도 에이전트가 고객 페르소나로 읽음 |
| **까다로운 고객** | 페르소나 역할을 맡은 AI. 지적·근거·제안 3단 구조로 피드백 |
| **Compound 사이클** | Build → Use → Notice → Fix 4단계 반복. 매주 한 바퀴 |
| **3번 반복 규칙** | 3번 반복되는 지적은 스킬·CLAUDE.md에 되먹인다 |
| **6축 O/X 체크리스트** | 구조·맥락·계획·실행·검증·개선 6축으로 4일 작업 자가진단 |
| **팀 repo** | 팀 공용 스킬 저장소. Play Store 모델 — 큰 룰만 정하고 자유 등록 |
| **2주 프로젝트** | 5/15 발표회까지 실제 업무에 3회 이상 적용 |

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
| B0 | 어제 스킬 평가 — 만든 쪽 vs 점검하는 쪽 | ~10분 |
| B1 | Generator vs Evaluator + 까다로운 고객 검증 | ~35분 |
| B2 | Compound 사이클 + 3번 반복 규칙 + 6축 자가진단 | ~30분 |
| B3 | 팀 repo + PR 워크플로우 | ~30분 |
| B4 | 2주 프로젝트 안내 + 마무리 | ~15분 |
| **합계** | | **~120분** |

> B1(까다로운 고객 검증)과 B3(팀 repo PR)이 오늘의 핵심 실습입니다.

---

## 블록 특수 규칙

- **Block B0 (어제 스킬 평가)**: QUIZ가 없다. Phase A에서 "만든 쪽은 편하게 본다" 문제 설명 → Stop. 완료 확인 후 B1.
- **Block B1 (Generator vs Evaluator)**: Phase A에서 역할 분리 원리 + 까다로운 고객 개념 + 검증 실습 안내 → Stop. Phase B에서 퀴즈.
- **Block B2 (Compound 사이클 + 6축)**: Phase A에서 Build→Use→Notice→Fix + 3번 반복 규칙 + 6축 O/X 체크 안내 → Stop. Phase B에서 퀴즈.
- **Block B3 (팀 repo + PR)**: QUIZ가 없다. Phase A에서 팀 repo 원칙 + 업로드 실습 + PR 워크플로우 안내 → Stop.
- **Block B4 (2주 프로젝트 안내)**: QUIZ가 없다. Phase A에서 타임라인 + 미션 3개 + 마무리 메시지 → Stop.

---

## References 파일 맵

| 블록 | 파일 | 주제 |
|------|------|------|
| B0 | `references/block-b0-evaluation-premise.md` | 어제 스킬 평가 전제 — 만든 쪽 vs 점검하는 쪽 |
| B1 | `references/block-b1-generator-evaluator.md` | Generator vs Evaluator + 까다로운 고객 검증 |
| B2 | `references/block-b2-compound-cycle.md` | Compound 사이클 + 3번 반복 규칙 + 6축 O/X |
| B3 | `references/block-b3-team-repo-pr.md` | 팀 repo 원칙 + 업로드 실습 + PR 워크플로우 |
| B4 | `references/block-b4-two-week-project.md` | 2주 프로젝트 타임라인 + 미션 + 마무리 |

---

## 진행 규칙

- 한 번에 한 블록씩 진행한다
- "다음", "skip", 블록 이름으로 이동한다
- 각 블록 시작 시 진행 상태를 표시한다: `📍 Day 4 진행: [Block B{N}] — 블록 제목`
- 모든 응답은 **한국어**로 한다

---

## 시작

스킬 시작 시 아래 테이블을 보여주고 AskUserQuestion으로 어디서 시작할지 물어본다.

| Block | 주제 | 내용 |
|-------|------|------|
| B0 | 어제 스킬 평가 | 만든 쪽은 편하게 본다 — 왜 외부 시각이 필요한가 |
| B1 | Generator vs Evaluator | 까다로운 고객이 내 초안을 읽으면? |
| B2 | Compound 사이클 | Build→Use→Notice→Fix + 3번 반복 규칙 + 6축 자가진단 |
| B3 | 팀 repo + PR | 내 스킬을 팀에 공유 |
| B4 | 2주 프로젝트 | 타임라인 + 미션 + 5/15 발표회 |

```json
AskUserQuestion({
  "questions": [{
    "question": "Day 4: 검증하고 개선하기\n\n어디서부터 시작할까요?",
    "header": "시작 블록",
    "options": [
      {"label": "처음부터 (B0)", "description": "어제 스킬 평가 전제부터 (추천)"},
      {"label": "까다로운 고객 (B1)", "description": "Generator vs Evaluator + 검증 실습"},
      {"label": "Compound 사이클 (B2)", "description": "6축 자가진단 + 3번 반복 규칙"},
      {"label": "팀 repo (B3)", "description": "내 스킬 팀에 공유"},
      {"label": "2주 프로젝트 (B4)", "description": "타임라인 + 미션 확인"}
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
| Generator vs Evaluator | 만든 쪽과 점검하는 쪽은 다른 역할 — 같으면 검증이 아닌 자기 확신 |
| 까다로운 고객 | 페르소나 역할 AI가 지적·근거·제안 3단 구조로 피드백 |
| Compound 사이클 | Build → Use → Notice → Fix → 매주 한 바퀴 |
| 3번 반복 규칙 | 3번 반복되는 지적 = 스킬에 되먹일 자리 |
| 6축 자가진단 | 구조·맥락·계획·실행·검증·개선 O/X 체크 |
| 팀 repo | Play Store 모델 — 큰 룰만 정하고 자유 등록 |

### 4일 여정 요약

```
Day 1: CLAUDE.md     = 고정 맥락 설계    ✅
Day 2: MCP + 스킬    = 맥락 확장 + 자동화 ✅
Day 3: 스킬 다듬기   = 암묵지 → 명시지   ✅
Day 4: 검증 + 개선   = 복리 사이클 시작   ✅ (오늘)
```

### 오늘의 산출물
- 까다로운 고객 피드백 메모
- 6축 O/X 자가진단 완료
- 팀 repo PR 1개

### 2주 프로젝트 미션
1. X 축 1개 고르기 (오늘 결정)
2. 실제 업무에 3회 이상 적용
3. 3번 반복 지적 1개를 rules·스킬에 되먹임 → PR

**5/15(금) 발표회에서 만납니다!**

> 4일 캠프 모든 과정을 완료했습니다. 수고하셨습니다!
