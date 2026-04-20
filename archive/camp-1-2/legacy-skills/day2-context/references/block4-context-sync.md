# Block 4: Context Sync 스킬 구축

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/sub-agents
> ```

## EXPLAIN

### Context Sync = 여러 도구에서 정보를 자동 수집하여 하나의 문서로 정리하는 스킬

**Before**: 매일 아침 30분 — Slack → Gmail → Calendar → Notion 하나씩 열어서 확인
**After**: "싱크해줘" → 1분 후 오늘의 컨텍스트가 하나의 문서로 정리

### 어떤 도구를 연결해야 할까?

> **"매일 아침 출근해서 가장 먼저 여는 앱이 무엇인가요?"** — 그 앱이 첫 번째 연결 대상입니다.

| 직종 | 추천 조합 | 왜? |
|------|-----------|-----|
| 마케터 | Slack + Gmail + 소셜미디어 | 캠페인 반응, 고객 문의, 팀 피드백을 한눈에 |
| PM/기획자 | Slack + Linear/Jira + Calendar | 이슈 현황, 오늘 미팅, 팀 대화 한 번에 파악 |
| 영업 | Gmail + Calendar + CRM | 고객 메일, 미팅 일정, 파이프라인 놓치지 않게 |
| 개발자 | Slack + GitHub + Linear | PR 리뷰, 이슈 현황, 팀 대화를 빠르게 |
| 디자이너 | Slack + Notion + Figma | 피드백, 태스크, 디자인 코멘트를 모아서 |

보통 2~3개면 충분합니다. 전부 연결할 필요 없습니다.

### 병렬 수집 — 카페 비유

**직원 1명인 카페 (순차 수집)**
- 한 명이 주문 받고 → 커피 만들고 → 디저트 준비하고 → 서빙
- 손님 3팀 처리에 30분

**직원 3명인 카페 (병렬 수집)**
- 한 명은 주문, 한 명은 커피, 한 명은 디저트
- 각자 맡은 일만 집중 → 손님 3팀 처리에 10분

Claude도 마찬가지입니다. Subagent를 여러 개 동시에 띄워서 각자 담당 도구에서 정보를 수집합니다.

### Subagent 병렬 수집

Slack, Notion, Calendar는 서로 의존성이 없음 → 각각 독립적으로 수집 가능 → Subagent로 동시에 실행하면 시간 절약

```
사용자: "싱크해줘"
    ↓
메인 Claude: "3개 Subagent 실행"
    ├─ Subagent 1 ─── Slack 수집
    ├─ Subagent 2 ─── Notion 수집
    └─ Subagent 3 ─── Calendar 수집
    ↓ (3개 동시 실행)
메인 Claude: 결과 통합 → 문서 생성
```

## EXECUTE

**Step 1: 도구 선택**

아래 조합 중 하나를 골라 Context Sync 스킬에 포함할 도구를 결정하세요:
- **Slack + Calendar** — 소통 + 일정 (기본)
- **Slack + Notion + Calendar** — 소통 + 지식 + 일정
- **Gmail + Calendar** — 이메일 + 일정
- 또는 원하는 도구 조합을 직접 선택

**Step 2: 스킬 골격 생성**

Claude에게 요청:
```
지금 선택한 도구들로 Context Sync 스킬 골격을 만들어줘.
.claude/skills/my-context-sync/SKILL.md 에 저장해줘.
```

**Step 3: SKILL.md 확인**

확인할 것:
- frontmatter (`name`, `description`) 존재
- 소스 정의 (어떤 도구에서 수집할지)
- 실행 흐름 (수집 → 통합 → 저장)
- 출력 형식 (md 파일)

**Step 4: 테스트 실행 (MCP가 연결된 경우)**
```
방금 만든 Context Sync 스킬을 실행해줘
```

> MCP가 연결되지 않았더라도, 스킬 골격을 만드는 것 자체가 학습입니다.

## QUIZ

**Q1. Context Sync 스킬의 핵심 가치는?**

```json
{
  "questions": [{
    "question": "Context Sync 스킬의 핵심 가치는?",
    "header": "Q1",
    "options": [
      {"label": "코드를 자동으로 작성해주는 것", "description": "코드 생성?"},
      {"label": "여러 도구의 맥락을 하나의 문서로 자동 정리하는 것", "description": "맥락 통합 자동화"},
      {"label": "파일을 자동으로 백업하는 것", "description": "백업?"},
      {"label": "이메일을 자동으로 보내는 것", "description": "이메일 발송?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (여러 도구의 맥락을 하나의 문서로 자동 정리)
해설: Context Sync는 여러 도구의 맥락을 수집하여 하나의 문서로 정리합니다.

**Q2. Subagent를 활용하면 좋은 이유는?**

```json
{
  "questions": [{
    "question": "Context Sync에서 Subagent를 활용하면 좋은 이유는?",
    "header": "Q2",
    "options": [
      {"label": "비용이 절감된다", "description": "비용 효율?"},
      {"label": "Slack, Notion, Calendar를 동시에 수집할 수 있다", "description": "병렬 처리로 시간 절약"},
      {"label": "결과가 더 정확해진다", "description": "정확도 향상?"},
      {"label": "보안이 강화된다", "description": "보안 효과?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (동시 수집 = 병렬 처리)
해설: 각 도구의 수집은 서로 의존성이 없으므로, Subagent로 병렬 수집하면 시간이 절약됩니다.

**Q3. 스킬의 출력 형식으로 가장 기본적인 것은?**

```json
{
  "questions": [{
    "question": "스킬의 출력 형식으로 가장 기본적인 것은?",
    "header": "Q3",
    "options": [
      {"label": "PDF 파일", "description": "PDF 포맷"},
      {"label": "엑셀 파일", "description": "스프레드시트"},
      {"label": "Markdown(.md) 파일", "description": "텍스트 기반 범용 포맷"},
      {"label": "이미지 파일", "description": "이미지 포맷"}
    ],
    "multiSelect": false
  }]
}
```
정답: 3번 (Markdown 파일)
해설: Markdown 파일이 가장 기본이고 범용적입니다. 이후 Slack 메시지나 Notion 페이지로 확장 가능합니다.

> 💡 Build → Use → Notice 단계입니다. 부족한 점이 보이나요?
