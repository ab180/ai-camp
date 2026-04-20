# Block 1: Compound Engineering — 복리의 힘

> 이 블록은 Compound Engineering 개념 설명이므로 공식 문서 URL이 없습니다.

## EXPLAIN

### Compound Engineering = 쓰면서 고치면 복리로 성장하는 것

**기존 방식 vs Compound 방식:**

| 기존 방식 | Compound 방식 |
|----------|--------------|
| AI에게 일 시킴 → 실수 → 채팅으로 고쳐달라고 함 → **다음에 또 같은 실수** | AI가 실수 → "왜?" 원인 파악 → CLAUDE.md에 규칙 추가 → **다음부터 그 실수 안 함** |

### 풀 사이클 6단계

```
Build    → 일단 만든다
Use      → 실제로 써본다
Notice   → 불편함을 발견한다
Debug    → 원인을 찾는다
Fix      → 한 가지만 고친다
Document → 기록한다
→ (다시 Use로 돌아가서 반복)
```

**핵심: 한번에 100% 만드는 게 아니라, 1%씩 100번 개선하는 것. 이게 복리입니다.**

### 구체적 이득 3가지

1. **같은 말을 반복하지 않아도 됨** — CLAUDE.md에 한번 적으면 영원히 적용
2. **혼자서도 팀만큼 결과** — 약한 모델 + 좋은 워크플로우(95.1%) > 강한 모델 단독(67.0%)
3. **미래 핵심 역량** — Microsoft 2025: 글로벌 리더 82%가 AI 에이전트 도입 예정

### 문서화가 성과를 만든다

**Google DORA 2023 연구:**
- 질 높은 내부 문서화 → 조직 성과에 **12.8배** 영향

**AI 시대의 문서화:**
- AI는 코드보다 문서화 품질을 가장 크게 개선 (+7.5%)
- CLAUDE.md, 스킬 설명, MCP 설정 — 다 "문서"이다

### Context vs Compound

| 구분 | Context Engineering | Compound Engineering |
|------|-------------------|---------------------|
| 역할 | 맥락을 **설계**하는 것 | 맥락을 쓰면서 **개선**하는 것 |
| 시점 | 처음 한 번 | 매번 반복 |
| 비유 | 설계도 그리기 | 설계도를 써보고 수정하기 |

### 오늘의 핵심 3줄

1. 만든 것의 가치는 **완성도가 아니라 반복 횟수**에 있다 (복리)
2. 불편함은 버그가 아니라 **개선의 신호**다 (풀 사이클)
3. 사이클을 **한 바퀴 돌린 사람**은 이미 Compound Engineering을 하고 있다

## EXECUTE

**풀 사이클 1회 시뮬레이션**

CLAUDE.md나 스킬 중 하나를 골라서, 풀 사이클의 "Notice" 단계를 직접 해보세요:

1. 지금까지 Claude와 대화하면서 **불편했던 점 1가지**를 떠올리기
2. Claude에게 물어보기: `"내 CLAUDE.md를 읽고, 개선할 수 있는 점 1가지를 알려줘"`
3. 제안이 마음에 들면 Block 4(실습)에서 직접 고칠 예정

→ Notice 단계의 핵심은 "불편함을 인식하는 것"입니다. 고치는 건 나중에!

## QUIZ

**Q1. Compound Engineering의 핵심 철학은?**

```json
{
  "questions": [{
    "question": "Compound Engineering의 핵심 철학은?",
    "header": "Q1",
    "options": [
      {"label": "완벽하게 만들어서 한 번에 완성", "description": "한 번에 끝내기?"},
      {"label": "일단 만들고, 쓰면서 계속 고치면 복리 성장", "description": "반복 개선"},
      {"label": "여러 사람이 함께 만들기", "description": "협업?"},
      {"label": "AI에게 모든 것을 맡기기", "description": "완전 위임?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (반복 개선으로 복리 성장)
해설: "잘 만들어서 완성하면 끝" ✕ → "일단 만들고 쓰면서 계속 고치면 복리" ✓

**Q2. 풀 사이클에서 "Notice" 단계의 역할은?**

```json
{
  "questions": [{
    "question": "풀 사이클에서 'Notice' 단계의 역할은?",
    "header": "Q2",
    "options": [
      {"label": "코드를 작성하는 단계", "description": "구현?"},
      {"label": "불편함을 발견하는 단계", "description": "개선 신호 포착"},
      {"label": "결과를 발표하는 단계", "description": "발표?"},
      {"label": "팀에 공유하는 단계", "description": "공유?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (불편함을 발견하는 단계)
해설: Notice는 실제로 써보면서 불편한 점을 발견하는 단계입니다. 이 불편함이 개선의 신호입니다.

**Q3. "약한 모델 + 좋은 워크플로우"가 "강한 모델 단독"보다 나은 이유는?**

```json
{
  "questions": [{
    "question": "'약한 모델 + 좋은 워크플로우'가 '강한 모델 단독'보다 나은 이유는?",
    "header": "Q3",
    "options": [
      {"label": "비용이 저렴해서", "description": "비용 절감?"},
      {"label": "워크플로우가 맥락과 구조를 제공하여 결과 품질을 높이므로", "description": "구조화된 맥락"},
      {"label": "약한 모델이 더 빨라서", "description": "속도?"},
      {"label": "강한 모델은 오류가 많아서", "description": "오류?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (구조화된 맥락)
해설: 워크플로우(스킬, CLAUDE.md 등)가 제공하는 구조화된 맥락이 모델 성능 차이를 뛰어넘습니다.
