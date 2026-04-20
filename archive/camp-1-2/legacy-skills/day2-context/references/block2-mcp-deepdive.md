# Block 2: MCP 딥다이브

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/mcp
> 📖 MCP 프로토콜: https://modelcontextprotocol.io
> ```

## EXPLAIN

### MCP (Model Context Protocol) = AI가 외부 서비스와 대화하는 표준 규약

**비유: USB-C 포트**
- 옛날: 기기마다 다른 포트 → 전용 케이블 필요
- 지금: USB-C 하나로 다 연결
- MCP: 도구마다 다른 API → MCP라는 **표준 규격**으로 통일

### 작동 방식

```
사용자: "Slack에서 #general 메시지 읽어줘"
    ↓
Claude → MCP 프로토콜 → Slack MCP 서버 → Slack API → 결과 반환
    ↓
Claude: "최근 메시지 10개입니다: ..."
```

핵심:
- Claude는 MCP 프로토콜만 알면 됨
- 각 도구의 API 세부사항은 MCP 서버가 처리
- 사용자는 자연어로 요청만 하면 됨

### 연결 방법 3가지 (쉬운 순서)

```
1순위: claude.ai Connectors (클릭 몇 번이면 끝)
──────────────────────────────────────────────
웹 브라우저에서 로그인만 하면 자동으로 연결된다.
스마트폰에서 "Google로 로그인" 버튼 누르는 것과 같다.

2순위: claude mcp add 명령어 (한 줄 입력)
──────────────────────────────────────────────
터미널에 명령어 한 줄을 입력하면 연결된다.
와이파이 비밀번호를 한 번 입력하면 자동 접속되는 것과 같다.

3순위: API 스크립트 (Claude가 코드를 짜줌)
──────────────────────────────────────────────
위 두 가지 방법이 안 되는 도구라면, Claude가 직접 코드를 작성해서 연결한다.
사용자가 코드를 짤 필요는 없다.
```

| 비교 | Connectors | mcp add 명령어 | API 스크립트 |
|------|-----------|---------------|-------------|
| 비유 | 블루투스 자동 연결 | 와이파이 비밀번호 입력 | 맞춤형 케이블 제작 |
| 난이도 | 클릭만 (가장 쉬움) | 명령어 한 줄 | Claude가 대신 작성 |
| 장점 | 설정 파일 필요 없음 | 빠르고 안정적 | 어떤 도구든 연결 가능 |

### `claude mcp add` 명령어 분해

이 명령어가 길어 보이지만, 한 단어씩 뜯어보면 간단합니다:

```bash
claude mcp add --transport http notion https://mcp.notion.com/mcp
```

| 입력 | 의미 | 쉽게 말하면 |
|------|------|-------------|
| `claude` | Claude Code 실행 | "클로드야," |
| `mcp` | MCP 기능 사용 | "MCP 관련해서," |
| `add` | 서버를 추가해줘 | "하나 추가해줘," |
| `--transport http` | 연결 방식 지정 | "웹으로 연결할 건데," |
| `notion` | 서버의 별명 | "이름은 notion이고," |
| `https://...` | 서버 실제 주소 | "주소는 여기야" |

> 즉, **"클로드야, MCP 서버 하나 추가해줘. 웹으로 연결할 건데, 이름은 notion이고, 주소는 여기야"** 라는 말입니다.

### 확인 및 관리

```
/mcp                              # 연결 상태 확인
claude mcp disable [서버명]        # 비활성화
claude mcp enable [서버명]         # 다시 활성화
```

### 컨텍스트 관리 팁

MCP 도구가 많으면 컨텍스트 토큰을 많이 소비합니다.

- ✅ 자주 쓰는 도구만 연결
- ✅ `/mcp`로 연결 상태 주기적 확인
- ✅ 문제 있으면 disable → 다시 enable
- ❌ 모든 도구를 한꺼번에 연결
- ❌ 사용하지 않는 연결 방치

## EXECUTE

**MCP 연결 상태 탐색**

아래 명령어를 Claude Code에서 직접 실행해보세요:

```
/mcp
```

→ 현재 연결된 MCP 서버 목록이 표시됩니다. 아직 없어도 괜찮습니다 — Block 3에서 직접 연결합니다.

> 이미 MCP가 연결되어 있다면, `"연결된 MCP 도구 목록을 보여주고 각각 무슨 역할인지 설명해줘"`라고 Claude에게 요청해보세요.

## QUIZ

**Q1. MCP의 역할은?**

```json
{
  "questions": [{
    "question": "MCP의 역할은?",
    "header": "Q1",
    "options": [
      {"label": "AI 모델을 학습시키는 것", "description": "모델 학습?"},
      {"label": "AI가 외부 서비스와 대화하는 표준 규약", "description": "표준 통신 프로토콜"},
      {"label": "데이터를 암호화하는 것", "description": "보안?"},
      {"label": "파일을 압축하는 것", "description": "압축?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (AI가 외부 서비스와 대화하는 표준 규약)
해설: MCP = Model Context Protocol, AI가 외부 도구와 통신하는 표준 규격입니다.

**Q2. MCP 연결에서 가장 쉬운 방법은?**

```json
{
  "questions": [{
    "question": "MCP 연결에서 가장 쉬운 방법은?",
    "header": "Q2",
    "options": [
      {"label": ".mcp.json 수동 편집", "description": "직접 파일 편집"},
      {"label": "API 키 직접 입력", "description": "API 키 관리"},
      {"label": "Connectors (클릭으로 연결)", "description": "웹에서 클릭만으로"},
      {"label": "코드 작성", "description": "코드 필요?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 3번 (Connectors)
해설: claude.ai/settings/connectors에서 버튼 클릭만으로 연결할 수 있습니다.

**Q3. MCP 연결 상태를 확인하는 명령어는?**

```json
{
  "questions": [{
    "question": "MCP 연결 상태를 확인하는 명령어는?",
    "header": "Q3",
    "options": [
      {"label": "/help", "description": "도움말?"},
      {"label": "/status", "description": "상태 확인?"},
      {"label": "/mcp", "description": "MCP 전용 확인 명령어"},
      {"label": "/connect", "description": "연결 명령어?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 3번 (/mcp)
해설: /mcp 명령어로 현재 연결된 MCP 서버와 사용 가능한 도구를 확인합니다.
