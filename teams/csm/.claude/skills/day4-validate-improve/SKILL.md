---
name: day4-validate-improve
description: AI Camp 3기 CSM Day 4 자가학습용 인터랙티브 스킬. Generator vs Evaluator + 앤트로픽 검증 사례 + Skill Creator + 까다로운 고객 + Compound 사이클 + wrap 파이프라인 + 6축 자가진단 + 팀 repo PR + Vercel/Supabase 부록. "4일차", "Day 4", "검증", "Compound", "wrap", "팀 repo", "Vercel", "Supabase" 요청에 사용.
---

# Day 4: 검증하고 개선하기 — Generator vs Evaluator + Compound + 팀 공유 + 부록

이 스킬이 호출되면 아래 **STOP PROTOCOL**을 반드시 따른다.

---

## 용어 정리

| 용어 | 설명 |
|------|------|
| **Generator** | 결과를 만드는 쪽. 본인 스킬이 만든 초안 |
| **Evaluator** | 결과를 점검하는 쪽. 별도 에이전트가 페르소나로 읽음 |
| **Constitutional AI** | Anthropic 검증 사례 — 작성자 모델 + 헌법 비평자 모델로 자체 검증 |
| **Multi-agent eval** | Anthropic 검증 사례 — 1개 답변을 N개 평가자가 합의 |
| **Skill Creator** | 본인 SKILL.md를 받아 부족 항목을 리포트하는 메타 스킬. Day 3 Notion B4 정합 |
| **까다로운 고객** | 페르소나 역할 AI. 지적·근거·제안 3단 구조로 피드백 |
| **Compound 사이클** | Build → Use → Notice → Fix 4단계 반복 |
| **wrap** | 세션 종료 시 자동 Notice + 신호 누적 + 메모리 저장. Compound 자동화 도구 |
| **3번 반복 규칙** | 3번 반복되는 지적은 스킬·CLAUDE.md에 되먹인다 |
| **6축 O/X 체크리스트** | 구조·맥락·계획·실행·검증·개선 6축으로 4일 작업 자가진단 |
| **팀 repo** | 팀 공용 스킬 저장소. Play Store 모델 — 큰 룰만, 자유 등록 |
| **1주 사이클 × 2회** | 캠프 종료 후 1주 단위 사이클 2번 → 5/15(금) 발표회 |

---

## STOP PROTOCOL — 절대 위반 금지

> 이 프로토콜은 이 스킬의 최우선 규칙이다.

### 각 블록은 반드시 2턴에 걸쳐 진행한다

```
┌─ Phase A (첫 번째 턴) ──────────────────────────────┐
│ 1. references/에서 해당 블록 파일의 EXPLAIN 섹션을 읽는다    │
│ 2. 내용을 설명한다                                        │
│ 3. references/에서 해당 블록 파일의 EXECUTE 섹션을 읽는다    │
│ 4. "지금 직접 실행해보세요"라고 안내한다                     │
│ 5. ⛔ 여기서 반드시 STOP. 턴을 종료한다.                    │
└──────────────────────────────────────────────────────────┘

  ⬇️ 사용자가 "했어", "완료", "다음" 입력

┌─ Phase B (두 번째 턴) ──────────────────────────────┐
│ 1. QUIZ 섹션 읽기 → AskUserQuestion으로 출제                │
│ 2. 정답/오답 피드백 + 다음 블록 이동 묻기                    │
└──────────────────────────────────────────────────────────┘
```

### 핵심 금지 사항

1. Phase A에서 AskUserQuestion을 호출하지 않는다
2. Phase A에서 퀴즈를 내지 않는다
3. Phase A에서 "실행해봤나요?"를 묻지 않는다
4. 한 턴에 EXPLAIN + QUIZ를 동시에 하지 않는다

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

## 소요 시간 가이드 (본 콘텐츠 120분 + 부록 선택)

| Block | 주제 | 예상 시간 |
|-------|------|-----------|
| B0 | 어제 스킬 평가 전제 | ~5분 |
| B1 | Generator vs Evaluator + Anthropic 사례 + Skill Creator + 까다로운 고객 | ~30분 |
| B2 | Compound 사이클 + wrap + 본인 파이프라인 만들기 + 6축 자가진단 | ~25분 |
| B3 | 팀 repo + 권한 + README 6축 + PR 워크플로우 | ~50분 |
| B4 | 1주 사이클 × 2회 안내 + 마무리 | ~10분 |
| **본 합계** | | **~120분** |
| 부록 1 | Vercel — CLAUDE.md/스킬 정적 호스팅 (3장) | 선택 |
| 부록 2 | Supabase — 팀 공용 데이터 저장소 (3장) | 선택 |
| 부록 3 | 까다로운 고객 프롬프트 전문 + 다음 학습 리소스 | 선택 |

> B1·B2가 핵심 학습 블록. B3은 팀 자산화. 부록은 캠프 종료 후 자율 학습.

---

## 블록 특수 규칙

- **B0 (5분)**: QUIZ 없음. Day 3 B0 사람 짝꿍 → Day 4 AI Evaluator 다리만 1-2장 → Stop.
- **B1 (30분)**: Phase A에서 G≠E 원리 + Anthropic 3사례 + 까다로운 고객 페르소나 + Skill Creator 호출 실습 안내 → Stop. Phase B 퀴즈.
- **B2 (25분)**: Phase A에서 Compound 4단계 + wrap 도식 + 본인 파이프라인 1단·2단 만들기 + 6축 + 첫날 vs 오늘 비교 안내 → Stop. Phase B 퀴즈.
- **B3 (50분)**: QUIZ 없음. Phase A에서 팀 repo Play Store 모델 + 권한 + README 6축 + 업로드 + PR 안내 → Stop.
- **B4 (10분)**: QUIZ 없음. Phase A에서 1주 사이클 × 2회 타임라인 + 미션 + 회고 포맷("별로였던 것 / 좋았던 것 각 2문장") → Stop.
- **부록 (선택)**: Phase A만. QUIZ 없음. 사용자가 명시 요청 시 부록 1·2·3 순으로 진행.

---

## References 파일 맵

| 블록 | 파일 | 주제 |
|------|------|------|
| B0 | `references/block-b0-evaluation-premise.md` | 어제 스킬 평가 전제 |
| B1 | `references/block-b1-generator-evaluator.md` | G≠E + Anthropic 사례 + Skill Creator + 까다로운 고객 |
| B2 | `references/block-b2-compound-cycle.md` | Compound + wrap + 파이프라인 + 6축 |
| B3 | `references/block-b3-team-repo-pr.md` | 팀 repo + 권한 + README + PR |
| B4 | `references/block-b4-two-week-project.md` | 1주 사이클 × 2회 + 회고 |
| 부록 1 | `references/appendix-vercel.md` | Vercel — CLAUDE.md 정적 호스팅 |
| 부록 2 | `references/appendix-supabase.md` | Supabase — 팀 공용 데이터 저장소 |
| 부록 3 | `references/appendix-closing.md` | 까다로운 고객 프롬프트 전문 + 학습 리소스 |

---

## 진행 규칙

- 한 번에 한 블록씩
- "다음", "skip", 블록 이름으로 이동
- 각 블록 시작 시: `📍 Day 4 진행: [Block B{N}] — 블록 제목`
- 모든 응답은 **한국어**
- 부록은 사용자가 "부록", "appendix", "vercel", "supabase" 명시 요청 시에만

---

## 시작

| Block | 주제 | 내용 |
|-------|------|------|
| B0 | 어제 스킬 평가 | Day 3 사람 짝꿍 → Day 4 AI Evaluator |
| B1 | G≠E + 까다로운 고객 | Anthropic 사례 + Skill Creator + 페르소나 검증 |
| B2 | Compound + wrap | Build→Use→Notice→Fix + 본인 파이프라인 만들기 + 6축 |
| B3 | 팀 repo + PR | Play Store 모델 + 권한 + README 6축 |
| B4 | 1주 사이클 × 2회 | 5/15 발표회 + 회고 포맷 |
| 부록 | Vercel·Supabase·프롬프트 | 캠프 후 자율 학습 |

```json
AskUserQuestion({
  "questions": [{
    "question": "Day 4: 검증하고 개선하기\n\n어디서부터 시작할까요?",
    "header": "시작 블록",
    "options": [
      {"label": "처음부터 (B0)", "description": "어제 스킬 평가 전제 (추천)"},
      {"label": "까다로운 고객 (B1)", "description": "Anthropic 사례 + Skill Creator + 페르소나 검증"},
      {"label": "Compound + wrap (B2)", "description": "본인 파이프라인 만들기 + 6축"},
      {"label": "팀 repo (B3)", "description": "팀 공유 + PR"},
      {"label": "1주 사이클 (B4)", "description": "타임라인 + 미션"},
      {"label": "부록 (Vercel/Supabase)", "description": "캠프 후 자율 학습"}
    ],
    "multiSelect": false
  }]
})
```

---

## 마무리

### 오늘 배운 것 정리

| 개념 | 핵심 |
|------|------|
| Generator ≠ Evaluator | 만든 쪽과 점검하는 쪽은 다른 역할 |
| Anthropic 검증 사례 | Constitutional AI / multi-agent eval / Skill Creator |
| 까다로운 고객 | 페르소나 AI가 지적·근거·제안 3단 피드백 |
| Skill Creator | 본인 SKILL.md → 부족 항목 리포트 (메타 스킬) |
| Compound 사이클 | Build → Use → Notice → Fix → 매주 한 바퀴 |
| wrap | Notice + 신호 누적 자동화 — Compound의 도구 |
| 본인 파이프라인 | SKILL.md `## 회고` + wrap + rules/ 자동 추가 |
| 3번 반복 규칙 | 3번 반복 지적 = 스킬에 되먹일 자리 |
| 6축 O/X | 구조·맥락·계획·실행·검증·개선 |
| 팀 repo | Play Store 모델 — 큰 룰만 + README 6축 태그 |

### 4일 여정

```
Day 1: CLAUDE.md     = 고정 맥락 설계         ✅
Day 2: MCP + 첫 스킬 = 맥락 확장 + 1사이클     ✅
Day 3: 본인 적용     = 사이클 반복 + Subagent  ✅
Day 4: 검증 + 개선   = 복리 사이클 + 팀 공유   ✅ (오늘)
```

### 오늘의 산출물
- 까다로운 고객 피드백 메모 + Skill Creator 리포트
- 6축 O/X 자가진단표
- 본인 Compound 파이프라인 1단 (SKILL.md `## 회고` + wrap)
- 팀 repo PR 1개 (6축 README)

### 1주 사이클 × 2회 미션
1. X 축 1개 고르기 (오늘 결정)
2. 첫 1주: 본인 업무에 3회 적용 + wrap으로 신호 누적
3. 둘째 1주: 3번 반복 지적을 rules·스킬에 되먹임 → PR
4. 회고 포맷: "별로였던 것 / 좋았던 것 **각 2문장**"

**5/15(금) 발표회에서 만납니다!**

> 4일 캠프 모든 과정을 완료했습니다. 수고하셨습니다!
> 부록 (Vercel·Supabase·프롬프트 전문)은 자율 학습용입니다.
