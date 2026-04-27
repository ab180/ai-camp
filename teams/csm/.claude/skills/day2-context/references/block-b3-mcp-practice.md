> Phase A 시작 시 반드시 아래 형태로 출력한다:
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/mcp
> 📖 추가 자료: https://code.claude.com/docs/ko/overview
> ```

## EXPLAIN

### 1. 핵심 한 줄
MCP 연결은 클릭 4번이지만, 연결 확인(Context Sync)까지 해야 "진짜 작동하는 맥락"이 완성된다.

---

### 2. 슬라이드 흐름 따라 개념 풀이

**연결 방식 1: claude.ai 웹 UI (OAuth) — 오늘 실습**

claude.ai에서 Settings → Integrations로 가면 연결 가능한 도구 목록이 있다. 선택 → Connect → OAuth 창 → 권한 승인 → 완료. 처음 해본다면 Gmail을 추천한다. 난이도가 가장 낮다.

연결 후 확인: Claude Code 또는 claude.ai 웹 채팅에서 `/mcp`를 입력하면 연결된 서버 목록이 나온다.

```
(You) /mcp
(Claude) Connected MCP servers:
  • gmail (status: active)
  • notion (status: active, scope: 12 pages)
```

`active`가 보이면 성공. `scope: 12 pages`는 내가 Notion에서 허용한 페이지 수.

**연결 방식 2·3: 개념만 (로컬 stdio·원격 HTTP)**

- **로컬 stdio**: 내 컴퓨터에서 MCP 서버를 직접 실행. 개발자용. `.claude.json`에 서버 경로 등록.
- **원격 HTTP/SSE**: 회사가 MCP 서버를 사내 URL에 호스팅. 팀 단위 공유 가능.

비개발자는 오늘은 1번만. 2·3번은 2주 프로젝트에서 도전하고 싶은 사람이 선택.

**Context Sync — 고객 한 명의 전체 맥락 통합**

MCP가 여러 개 연결되면 한 번에 여러 도구를 묶어서 읽을 수 있다. 이것이 Context Sync다.

예시 프롬프트:
```
고객사 X QBR 준비에 필요한 맥락을 SFDC·Notion·Slack에서 모아줘.
- SFDC: 계약 단계·최근 OPP 상태
- Notion: 지난 QBR 노트 핵심 3줄
- Slack: 이번 주 이 고객 관련 논의
한 페이지로 통합 요약.
```

핵심: "어느 도구를 써라"가 아니라 "무엇을 모아라"가 프롬프트다. AI가 각 MCP를 알아서 호출한다.

**관찰 포인트 3가지**

- **누락**: 어느 도구의 어떤 정보가 비었나? 권한 문제인가 프롬프트 문제인가?
- **중복**: 같은 이야기가 두 도구에서 왔을 때 AI가 한 번으로 합쳤나?
- **맥락 깊이**: 표면 요약인가, 의사결정에 쓸만한 수준인가?

**문제 해결 3가지 패턴**

| 증상 | 원인 | 해결 |
|-----|------|------|
| `/mcp`가 서버를 못 찾음 | Claude Code 재시작 안 함 | 세션 끄고 다시 열기 |
| OAuth 창이 안 뜸 | 브라우저 팝업 차단 | 팝업 허용 후 재시도 |
| 권한 승인 후에도 scope 0 | Google Workspace 관리자 제한 | 운영진에게 공유 |

---

### 3. CSM 일상 적용

**시나리오 1 — Gmail MCP로 미팅 전 준비**

"체크업 미팅 전에 고객 A가 최근 2주 내 보낸 메일 요약해줘"를 Gmail MCP가 연결된 상태에서 입력하면 실제 메일을 읽고 요약한다. 메일을 열고 스크롤하는 시간이 사라진다.

**시나리오 2 — Notion MCP로 지난 미팅 노트 가져오기**

"지난 분기 체크업 미팅 노트 핵심 3가지 뽑아줘"를 Notion MCP가 연결된 상태에서 입력하면 해당 페이지를 직접 읽는다. 노트를 찾아 열고 복사하는 과정이 없어진다.

**시나리오 3 — Context Sync로 QBR 준비 한 번에**

SFDC + Notion + Slack을 묶어서 QBR 준비 요약을 한 번에 받으면, 세 도구를 각각 열어 정보를 모으던 과정이 하나의 요청으로 대체된다.

---

### 4. 흔한 오해

**오해 1 — "/mcp가 나오면 연결 완료다"**

`/mcp`에서 서버 이름이 보여도 실제로 데이터를 잘 가져오는지 확인이 필요하다. "내 최근 페이지 목록 줘" 같은 간단한 테스트를 해봐야 진짜 연결된 것이다.

**오해 2 — "MCP가 연결되면 모든 데이터를 AI가 자동으로 읽는다"**

AI는 요청을 받아야 읽는다. MCP는 "AI가 읽을 수 있는 통로"이지 "자동으로 읽는 것"이 아니다. 질문할 때 "어느 도구에서 가져와라"를 명시하거나 Context Sync 프롬프트를 써야 한다.

**오해 3 — "Slack MCP가 안 되면 실습 실패다"**

회사 Slack 정책상 외부 앱을 막아두는 경우가 많다. Slack MCP가 안 되면 Notion이나 Gmail로 대체하면 된다. 오늘 산출물은 "특정 도구"가 아니라 "1개 이상 연결 완료"다.

---

## EXECUTE

### 지금 직접 해보세요

**준비**: claude.ai 로그인 상태, Gmail 또는 Notion 계정

**Gmail MCP 연결 (난이도 낮음)**

1. `claude.ai` 열기 → 우측 상단 프로필 → **Settings**
2. **Integrations** 탭 → **Gmail** → **Connect**
3. Google 계정 로그인 → 권한 승인 (읽기 권한만 선택 권장)
4. Claude Code 세션에서: `/mcp` 입력
5. `gmail (status: active)` 보이면 성공

**Notion MCP 연결 (난이도 낮음)**

1. `claude.ai` → Settings → Integrations → **Notion** → Connect
2. Notion 워크스페이스 선택 (본인 workspace 확인)
3. **페이지 범위 선택** — 전체 주지 말고 CSM 업무 관련 페이지만 선택 권장
4. `/mcp` 확인 → `"내 최근 페이지 목록 줘"` 테스트

**Context Sync 실습**

연결된 MCP가 2개 이상이면:
```
고객 [이름] 다음 미팅 준비에 필요한 맥락을 연결된 도구에서 모아줘.
한 페이지 분량으로 요약.
```

**막혔을 때**:
- Claude Code 세션을 껐다가 다시 켜보기
- OAuth 창이 안 뜨면 브라우저 팝업 차단 설정 해제
- Slack이 막히면 Notion으로 전환
- 15분 안에 안 되면 다른 도구로 전환 (오늘 산출물은 1개 이상이면 OK)

---

## QUIZ

**Q1. `/mcp`를 실행했는데 아무것도 안 나온다. 가장 먼저 해볼 것은?**

```json
AskUserQuestion({
  "questions": [{
    "question": "claude.ai에서 Gmail MCP를 연결했는데 Claude Code에서 /mcp를 실행하면 빈 목록이다. 가장 먼저 할 것은?",
    "header": "Quiz Day2-B3-1",
    "options": [
      {"label": "MCP가 Claude Code를 지원하지 않는 것이므로 포기한다", "description": "지원 여부 오해"},
      {"label": "Claude Code 세션을 완전히 종료하고 다시 실행한다", "description": "세션 재시작"},
      {"label": "Gmail MCP를 삭제하고 Notion으로 다시 연결한다", "description": "도구 교체"},
      {"label": "google.com에서 Gmail을 다시 로그인한다", "description": "Gmail 로그인 문제"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번

해설: 슬라이드(S28) 문제 해결표의 첫 번째 항목이다. "/mcp가 서버를 못 찾음" → "원인: Claude Code 재시작 안 함" → "해결: 세션 끄고 다시 열기". claude.ai에서 연결해도 기존 Claude Code 세션에는 바로 반영이 안 될 수 있다. 세션을 재시작하는 것이 가장 빠른 해결 방법이다.

---

**Q2. Context Sync 프롬프트에서 "어느 도구를 써라"가 아니라 "무엇을 모아라"고 써야 하는 이유는?**

```json
AskUserQuestion({
  "questions": [{
    "question": "Context Sync 프롬프트를 작성할 때 '무엇을 모아라' 형식이 '어느 도구를 써라' 형식보다 나은 이유는?",
    "header": "Quiz Day2-B3-2",
    "options": [
      {"label": "AI가 도구 이름을 모를 수 있다", "description": "AI 도구 인식 문제"},
      {"label": "AI가 맥락에 따라 적절한 도구를 자율적으로 선택·조합할 수 있어 유연하다", "description": "AI 자율성 활용"},
      {"label": "'어느 도구' 형식은 문법이 틀렸다", "description": "문법 문제"},
      {"label": "도구를 명시하면 권한 오류가 날 수 있다", "description": "권한 오류 가정"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번

해설: AI는 연결된 MCP 도구들을 알고 있다. "무엇이 필요한가"를 기준으로 적절한 도구를 알아서 조합한다. 다만 "SFDC에서 계약 정보, Notion에서 미팅 노트"처럼 **도구별로 원하는 정보를 명시**하면 품질이 더 예측 가능해진다(슬라이드 S32). 완전히 맡기는 것과 세부 가이드를 주는 것의 차이다. 둘 다 "무엇을 모아라" 형식이지만 구체성 수준이 다르다.