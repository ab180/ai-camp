# Block 3-3: MCP — 외부 도구 연결

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/mcp
> 📖 MCP 프로토콜: https://modelcontextprotocol.io
> ```

## EXPLAIN

| 항목 | 내용 |
|------|------|
| 정식 이름 | Model Context Protocol |
| 비유 | USB-C 포트 — 하나의 표준 규격으로 여러 도구를 연결 |
| 핵심 | AI가 외부 서비스(Slack, Notion, Gmail 등)와 대화하는 표준 통로 |

### 왜 USB-C에 비유하나?

USB-C 하나로 충전기/모니터/외장하드를 다 연결하듯, MCP 하나로 Slack/Notion/Gmail을 다 연결합니다.

```
┌─────────────┐     MCP      ┌─────────┐
│             │──────────────▶│ Slack   │
│  Claude     │──────────────▶│ Notion  │
│  Code       │──────────────▶│ Gmail   │
│             │──────────────▶│ Calendar│
└─────────────┘              └─────────┘
   하나의 표준              여러 도구
```

### MCP 연결 방법

```bash
# .mcp.json 파일로 설정
{
  "mcpServers": {
    "서버이름": {
      "command": "npx",
      "args": ["-y", "서버-패키지"]
    }
  }
}
```

> Day 2에서 직접 MCP를 연결해봅니다. 지금은 "하나의 표준으로 여러 도구를 연결한다"만 기억하세요.

## EXECUTE

아래를 Claude에게 요청해보세요:

```
/mcp
```

→ 현재 연결된 MCP 서버 목록을 확인합니다. 아직 없어도 괜찮습니다.

> 아직 연결된 MCP가 없어도 정상입니다. Day 2에서 직접 연결합니다.

## QUIZ

```json
AskUserQuestion({
  "questions": [{
    "question": "MCP를 USB-C에 비유하는 이유는?",
    "header": "Quiz 3-3",
    "options": [
      {"label": "하나의 표준 규격으로 여러 도구를 연결할 수 있어서", "description": "표준의 힘"},
      {"label": "물리적으로 연결해야 해서", "description": "물리적 연결?"},
      {"label": "속도가 빨라서", "description": "속도 때문?"}
    ],
    "multiSelect": false
  }]
})
```

정답: 1번.
해설: USB-C 하나로 충전기/모니터/외장하드를 다 연결하듯, MCP 하나로 Slack/Notion/Gmail을 다 연결합니다.
