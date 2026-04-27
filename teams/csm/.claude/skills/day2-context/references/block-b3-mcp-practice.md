# Block B3: MCP 연결 실습 + Context Sync

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/mcp
> ```

## EXPLAIN

### Context Sync — 합치면 고객이 보인다

Context Sync는 특별한 기능이 아니다.
여러 MCP가 하나의 질문을 병렬로 읽고 합친 답을 주는 사용 방식이다.

```
"고객 A 체크업 미팅 준비 요약해줘" 한 요청

  SFDC    ─┐
  Notion  ─┼──► 각자 자기 조각을 가져와 합산
  Slack   ─┘

결과: SFDC 계약 단계 + Notion 지난 체크업 노트 + Slack 이번 주 논의
     → 한 번에 실제 상황 파악
```

### /mcp로 연결 상태 확인

```
/mcp
```

MCP 서버 목록과 연결 상태가 나온다. 연결된 게 없으면 아래 실습으로.

### MCP 연결 전 3가지 확인

| 확인 항목 | 이유 |
|---------|------|
| **권한** | 회사 계정 MCP는 IT 승인 필요할 수 있음 |
| **토큰** | OAuth 토큰은 주기적으로 만료됨 |
| **보안** | 외부 MCP 서버는 데이터를 볼 수 있음 |

연결 실패해도 괜찮다. 개념 이해만으로 다음 블록(B4)로 넘어갈 수 있다.

## EXECUTE

**1단계: claude.ai에서 MCP 연결**
1. claude.ai 접속 → Settings → Integrations
2. Gmail, Notion, Slack 중 1개 선택
3. "Connect" → OAuth 인증 완료

**2단계: /mcp 확인**
Claude Code에서:
```
/mcp
```
연결된 도구가 목록에 보이면 성공.

**3단계: Context Sync 프롬프트 테스트**
실습용 고객사 1개를 선택하고:
```
[고객사명] 의 현재 상황을 요약해줘.
연결된 도구(Notion, Salesforce, Slack 등)에서 최신 정보를 모아줘.
```
나온 요약을 읽어보세요. 한 도구만 봤을 때와 어떻게 다른지 확인.

> 연결이 잘 안 되어도 괜찮습니다. "개념만 이해했어요"라고 하면 B4로 넘어갑니다.

## QUIZ

이 블록은 QUIZ 없음. 완료 확인 후 B4로 이동.
