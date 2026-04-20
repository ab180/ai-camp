# Block 0: Context Engineering — 이 캠프의 정체

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/features-overview
> ```

## EXPLAIN

**4일의 여정을 돌아보면:**

| Day | 활동 | Context Engineering 관점 |
|-----|------|-------------------------|
| Day 1 | CLAUDE.md 작성 | Context **설계** |
| Day 2 | MCP 연결 | Context **확장** |
| Day 3 | 스킬 제작 | Context **활용** |
| Day 4 | 쓰면서 고치기 | Context **개선** (오늘) |

> "프롬프트 잘 쓰는 법을 배운 게 아닙니다.
> AI가 참고할 맥락 전체를 설계한 겁니다. **이미 하고 있었어요.**"

### Harness 통합 다이어그램

여러분이 3일간 만든 것들은 독립된 기능이 아니라, AI를 원하는 방향으로 이끄는 하나의 시스템입니다.

```
          ┌── Harness (AI를 이끄는 시스템) ──┐
          │                                  │
CLAUDE.md ┤  기본 맥락 (항상 로딩)            │
MCP ──────┤  외부 맥락 (도구 연결)            │──▶ AI 출력 품질
Skill ────┤  실행 맥락 (필요할 때 로딩)       │
          │                                  │
          └── Compound: 쓰면서 계속 개선 ────┘
```

### Context Engineering이란?

AI가 참고할 맥락 전체를 설계하고 관리하는 기술

**진화 과정:**

| 시기 | 패러다임 | 핵심 |
|------|----------|------|
| 2023 | Prompt Engineering | 프롬프트를 잘 쓰면 된다 |
| 2024 | RAG, Few-shot | 프롬프트 + 맥락 구성 |
| 2025~ | **Context Engineering** | 맥락 자체를 설계/관리 |

### 업계가 발견한 3가지 교훈

1. **프롬프트가 아니라 데이터가 문제** — CLAUDE.md가 부정확하면 결과도 부정확
2. **계획 리뷰 > 결과 리뷰** — 2,000줄 결과물보다 200줄 계획을 리뷰하는 게 효율적
3. **한번 설계하면 매번 효과** — 맥락을 한번 잘 설계하면 "대충 물어봐도" AI가 잘 답한다

### 핵심 공식

- AI 모델 = 순수 함수 (Pure Function)
- 출력의 품질을 결정하는 건 오직 **입력의 품질**
- Garbage In, Garbage Out

### 지식의 저주 (Curse of Knowledge)

**Stanford Newton 실험 (1990)**
- 120곡을 손가락으로 두드려서 상대방에게 맞히게 함
- 두드리는 사람 예측: 50% → 실제 정답률: 2.5% → **20배 과대평가**

> 핵심: 내가 아는 맥락을 AI도 안다고 착각하면 안 된다. **명시적으로 전달**해야 한다.

### 역할의 변화: 타이피스트에서 매니저로

| 과거 | 지금 |
|------|------|
| 직접 타이핑하는 사람 | AI를 관리하는 사람 |
| 직접 문서 쓰고, 직접 분석하고, 직접 코드 짬 | 계획을 세워주고, 결과물을 검토하고, 피드백하고 승인 |

- **Context Engineering** = AI가 참고할 맥락을 설계하는 것 (설계)
- **Compound Engineering** = 그 맥락을 쓰면서 계속 개선하는 것 (반복)

> "설계만 하고 안 고치면 낡아갑니다. 고치는 과정이 복리입니다."

## EXECUTE

**나의 Context Engineering 점검**

Day 1~3에서 만든 것들을 돌아보세요:

1. `cat CLAUDE.md` — 내 CLAUDE.md에 어떤 맥락이 담겨 있는지 확인
2. `/mcp` — 어떤 외부 도구가 연결되어 있는지 확인
3. 스킬이 있다면 `.claude/skills/` 폴더를 확인

→ "내가 설계한 맥락 중 가장 잘 작동하는 것과 개선이 필요한 것"을 한 가지씩 떠올려보세요.

## QUIZ

**Q1. Day 1~3에서 우리가 실제로 해온 것은?**

```json
{
  "questions": [{
    "question": "Day 1~3에서 우리가 실제로 해온 것은?",
    "header": "Q1",
    "options": [
      {"label": "프로그래밍 학습", "description": "코딩 배우기?"},
      {"label": "AI 모델 학습", "description": "모델 트레이닝?"},
      {"label": "Context Engineering (맥락 설계/확장/활용)", "description": "맥락 전체를 설계"},
      {"label": "데이터 분석", "description": "데이터 처리?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 3번 (Context Engineering)
해설: CLAUDE.md(설계) → MCP(확장) → 스킬(활용)은 모두 AI가 참고할 맥락을 다루는 Context Engineering이었습니다.

**Q2. "계획 리뷰가 결과 리뷰보다 효율적"인 이유는?**

```json
{
  "questions": [{
    "question": "'계획 리뷰가 결과 리뷰보다 효율적'인 이유는?",
    "header": "Q2",
    "options": [
      {"label": "계획이 더 짧아서 읽기 쉬우니까", "description": "짧은 문서?"},
      {"label": "200줄 계획을 잡아야 2,000줄 결과물의 방향을 통제할 수 있으니까", "description": "방향 통제"},
      {"label": "결과물은 리뷰할 필요가 없어서", "description": "리뷰 불필요?"},
      {"label": "계획에는 오류가 없어서", "description": "오류 없음?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (방향 통제)
해설: AI에게 먼저 계획을 세우게 하고 계획을 검토하면, 잘못된 방향으로 2,000줄을 쓰는 것을 방지합니다.

**Q3. Context Engineering에서 "입력의 품질"이란?**

```json
{
  "questions": [{
    "question": "Context Engineering에서 '입력의 품질'이란?",
    "header": "Q3",
    "options": [
      {"label": "타이핑 속도", "description": "입력 속도?"},
      {"label": "CLAUDE.md, MCP, 스킬 등 AI에게 제공하는 맥락의 질", "description": "맥락의 질"},
      {"label": "컴퓨터 사양", "description": "하드웨어?"},
      {"label": "인터넷 속도", "description": "네트워크?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (맥락의 질)
해설: AI 모델은 순수 함수입니다. 맥락(입력)의 품질이 결과(출력)의 품질을 결정합니다.
