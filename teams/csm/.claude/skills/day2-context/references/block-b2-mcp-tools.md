# Block B2: MCP 개념 + CSM 도구 6개

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/mcp
> ```

## EXPLAIN

### MCP = AI와 도구를 잇는 표준 포트

```
한 줄 정의: "어떤 AI든, 어떤 도구든 같은 포트로 연결된다"
```

**USB-C 비유**

```
예전 (USB-C 이전)
  핸드폰마다 다른 충전기
  Claude용 Gmail 연동, ChatGPT용 Gmail 연동이 따로 필요

MCP 이후 (USB-C처럼)
  MCP 서버 한 번 만들면 어떤 AI든 연결
  Claude에서 Gmail MCP → AI가 실제로 메일을 읽어서 답함
```

| 항목 | 설명 |
|------|------|
| **MCP 풀네임** | Model Context Protocol |
| **누가 만들었나** | Anthropic (2024년 공개) |
| **왜 중요** | 도구마다 별도 연동이 사라짐. 한 번 만든 서버를 여러 AI가 재사용 |
| **CSM 예시** | claude.ai에서 Gmail MCP 켜면 AI가 실제 메일 읽어서 답함 |

### CSM 일상을 6개 도구가 나눠 담는다

| 도구 | 담당 맥락 | 담당 질문 |
|------|---------|---------|
| **Salesforce** | 고객 기록·파이프라인·계약 단계 | "이 고객 계약은 언제까지?" |
| **Plain** | 문의·티켓·답변 히스토리 | "이 고객이 뭘 물어봤나?" |
| **Notion** | 미팅 노트·합의사항·내부 운영 | "지난 체크업에서 뭐가 나왔나?" |
| **Gmail** | 고객 메일 스레드·첨부·시간순 대화 | "최근 메일에서 무슨 얘기가 나왔나?" |
| **Sheets** | 지표·수치·주기 집계 | "이번 달 이 고객 활성 이벤트 수?" |
| **Slack** | 실시간 협업·빠른 결정·내부 논의 | "오늘 이 고객 관련 얘기가 있었나?" |

> 이 중 어느 하나도 전부가 아니다. **합쳐야 고객이 보인다.**

## EXECUTE

이 블록은 개념 학습 위주입니다. 실제 MCP 연결은 B3에서 합니다.

지금 claude.ai 설정을 열어보세요:
1. claude.ai 우측 상단 → Settings → Integrations
2. 어떤 MCP 연결이 가능한지 목록 확인
3. Gmail, Notion, Slack 중 가장 많이 쓰는 도구를 확인해두기

## QUIZ

```json
AskUserQuestion({
  "questions": [{
    "question": "MCP의 핵심 장점은 무엇인가요?",
    "header": "Quiz B2",
    "options": [
      {"label": "AI가 더 빠르게 답한다", "description": "속도 문제가 아님"},
      {"label": "도구마다 별도 연동 없이 하나의 표준으로 연결", "description": "USB-C 비유"},
      {"label": "Claude만 사용할 수 있다", "description": "어떤 AI든 연결 가능"},
      {"label": "비용이 줄어든다", "description": "비용 문제가 아님"}
    ],
    "multiSelect": false
  }]
})
```

정답: 도구마다 별도 연동 없이 하나의 표준으로 연결.
해설: MCP 이전에는 Claude용 Gmail 연동, ChatGPT용 Gmail 연동이 따로 필요했습니다. MCP 이후 한 번 만든 서버를 여러 AI가 재사용할 수 있게 됐습니다. USB-C처럼 하나의 규격으로 통일된 것이 핵심입니다.
