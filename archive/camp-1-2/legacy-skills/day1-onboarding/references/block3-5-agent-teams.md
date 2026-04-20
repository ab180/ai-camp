# Block 3-5: Agent Teams — 팀 단위 분업

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/agent-teams
> 📖 서브에이전트: https://code.claude.com/docs/ko/sub-agents
> ```

## EXPLAIN

| 항목 | 내용 |
|------|------|
| 비유 | 프로젝트 TF — 팀원끼리 소통하며 협업 |
| 핵심 | 여러 에이전트가 **소통하며** 큰 작업을 나눠 처리 |

### Subagent vs Agent Teams

| 구분 | Subagent | Agent Teams |
|------|----------|-------------|
| 관계 | 1:1 위임 | 팀 프로젝트 |
| 소통 | 보고만 받음 | 팀원 간 소통 가능 |
| 작업 | 독립적 | 공유 태스크 |
| 비유 | "이거 조사해와" | "함께 이 프로젝트 하자" |

### 비유: 동시 통역

```
Subagent:
  나 → "이거 번역해" → 번역가 → 결과

Agent Teams:
  나 → "이 프로젝트를 함께 하자"
        ├── 디자이너: UI 설계
        ├── 개발자: 구현
        └── QA: 검증
        (서로 소통하며 진행)
```

> Agent Teams는 고급 기능입니다. Day 1에서는 "Subagent의 팀 버전"이라고 이해하면 충분합니다.

## EXECUTE

아래를 Claude에게 요청해보세요:

```
Subagent와 Agent Teams의 차이를 실제 예시로 설명해줘
```

→ Claude가 두 기능의 차이를 구체적인 예시로 설명해줍니다.
