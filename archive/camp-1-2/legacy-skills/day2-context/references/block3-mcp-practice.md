# Block 3: MCP 실습

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/mcp
> ```

## EXPLAIN

Block 2에서 MCP 개념을 배웠습니다. 이제 실제로 연결해봅니다.

### 연결 전 마음가짐

MCP 연결은 **인증 문제로 막히는 경우가 꽤 있습니다**. 당황하지 마세요.

- 한 번에 안 되면 다른 서비스로 시도하면 됩니다
- 모든 서비스를 연결할 필요 없습니다 — 1개만 성공해도 충분합니다
- 연결이 전혀 안 되어도 괜찮습니다 — 개념을 이해한 것만으로도 Day 2의 목표를 달성합니다

> **완벽한 연결보다 동작하는 스킬이 더 중요합니다.** 연결 가능한 것부터 먼저 진행하세요.

### Plan B: Fetch MCP만으로 진행하기

다른 서비스 연결이 어려우면, Fetch MCP만 설치해도 웹페이지에서 정보를 수집할 수 있습니다:

```bash
claude mcp add --transport stdio fetch -- npx -y @anthropic-ai/mcp-fetch@latest
```

이것만 연결해도 RSS 피드, 공개 API, 웹페이지 등에서 정보를 수집할 수 있습니다.

## EXECUTE

**Step 1: 현재 MCP 상태 확인**

Claude에게 요청하세요:
```
현재 연결된 MCP 서버 목록을 보여줘
```
→ 또는 직접 `/mcp` 입력

**Step 2: MCP 연결하기 (아래 중 하나 선택)**

**옵션 A: Notion MCP (추천)**
```
Notion MCP를 연결해줘
```
→ Claude가 `claude mcp add --transport http notion https://mcp.notion.com/mcp` 실행

**옵션 B: 다른 도구**

Notion 외에 다른 도구를 연결하고 싶다면 Claude에게 요청하세요:
- **Slack**: "Slack MCP를 연결해줘"
- **Google Calendar**: "Google Calendar MCP를 연결해줘"
- **건너뛰기**: 지금 연결이 어려우면 개념만 이해하고 넘어가도 괜찮습니다

**Step 3: 연결 확인**
```
/mcp
```
→ 연결한 도구가 ✅ 상태인지 확인

**Step 4: 연결된 도구 활용 테스트**

Notion을 연결했다면:
```
Notion에서 최근 업데이트된 페이지 3개를 보여줘
```

Calendar를 연결했다면:
```
이번 주 일정을 보여줘
```

> MCP 연결이 어려운 경우, 다음 블록으로 넘어가도 괜찮습니다. 개념 이해가 우선입니다.
