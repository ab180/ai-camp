> Phase A 시작 시 반드시 아래 형태로 출력한다:
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/overview
> 📖 추가 자료: https://code.claude.com/docs/ko/skills
> ```

## EXPLAIN

### 1. 핵심 한 줄
Claude Code는 단순한 채팅창이 아니라 7가지 기능이 결합된 "코드베이스 위에서 작동하는 AI 에이전트"다.

---

### 2. 슬라이드 흐름 따라 개념 풀이

Claude Code는 터미널(검은 화면)에서 실행되는 Claude다. 일반 채팅과 다른 점은 **폴더와 파일을 직접 읽고 수정하고, 도구를 연결하고, 작업을 나눠서 처리할 수 있다**는 것이다.

공식 문서에서 Claude Code를 "에이전트형 코딩 도구"라고 설명하는데, CSM에게는 "에이전트형 업무 도구"로 이해하면 된다.

**7가지 핵심 기능**

**1. 파일 읽기·쓰기**

Claude Code는 내 폴더의 파일을 직접 읽을 수 있다. 미팅 노트가 텍스트 파일로 있으면 "이거 읽고 리캡 메일 써줘"가 된다. 수정도 가능하다. 일반 채팅에서 파일을 첨부해서 대화하는 것과 다르게, 폴더 전체를 컨텍스트로 쓸 수 있다.

**2. 터미널 명령 실행**

`git commit`, `git push` 같은 명령을 Claude가 대신 실행할 수 있다. CSM에게는 "파일을 팀 repo에 올려줘"를 말로 시킬 수 있다는 의미다. (Day 2에서 실습)

**3. 웹 검색**

최신 정보가 필요할 때 Claude가 직접 웹을 검색해서 답할 수 있다. "경쟁사 최신 가격 알아봐줘" 같은 요청도 가능하다.

**4. MCP(도구 연결)**

Gmail·Notion·Slack 같은 외부 도구를 연결하면 Claude가 직접 읽고 쓸 수 있다. "지난주 고객 A 메일 요약해줘"를 Gmail을 연결하면 실제로 읽어서 답한다. (Day 2의 핵심)

**5. 스킬(슬래시 명령)**

`/스킬이름`으로 특정 작업을 수행하는 템플릿을 불러온다. 리캡 메일 스킬을 만들어두면 `/recap`으로 바로 실행된다. (Day 3에서 제작)

**6. Subagent(병렬 작업)**

메인 Claude가 여러 개의 보조 Claude를 동시에 띄워 각각 다른 작업을 시키고 결과를 합친다. "고객 A의 SFDC 정보와 Notion 노트와 최근 Slack 논의를 동시에 가져와 합쳐줘" 같은 작업이 가능하다. (Day 3에서 개념 학습)

**7. CLAUDE.md 자동 읽기**

프로젝트 폴더의 CLAUDE.md를 모든 세션 시작 시 자동으로 읽는다. 오늘의 핵심. 이것이 다른 6가지 기능의 기반이 된다.

**CSM 관점의 우선순위**

오늘(Day 1)은 7번(CLAUDE.md). Day 2는 4번(MCP). Day 3은 5번(스킬)·6번(Subagent). Day 4는 전체를 검증하고 팀에 공유하는 방법. 4일 캠프가 이 7가지를 단계적으로 쌓는 구조다.

---

### 3. CSM 일상 적용

**시나리오 1 — 파일 읽기로 리캡 생성**

Notion에서 미팅 노트를 텍스트 파일로 내보내서 폴더에 두면, "이 파일 읽고 리캡 메일 써줘"가 가능해진다. 복사·붙여넣기 없이 파일 경로만 알려주면 된다.

**시나리오 2 — MCP로 실시간 맥락 읽기**

Gmail MCP를 연결하면 "지난주 고객 A가 보낸 메일 요약해줘"를 실제로 실행할 수 있다. 메일을 열어서 복사하고 붙여넣는 과정이 사라진다.

**시나리오 3 — 스킬로 반복 작업 자동화**

리캡 메일 스킬을 만들어두면 `/recap 고객A`만 입력하면 된다. 매번 "리캡 메일 써줘, 우리 팀 톤은 이렇고, 금지어는 이것이고..."를 설명하지 않아도 된다.

---

### 4. 흔한 오해

**오해 1 — "Claude Code는 개발자만 쓰는 도구다"**

이름에 "Code"가 들어있지만 파일과 도구를 다루는 AI 에이전트다. 코드를 한 줄도 몰라도 CLAUDE.md를 만들고 스킬을 쓰고 MCP를 연결할 수 있다. 오늘 실습이 그 증거다.

**오해 2 — "7가지 기능을 다 써야 한다"**

기능은 필요한 것부터 하나씩 추가하면 된다. 오늘은 CLAUDE.md 하나만. Day 4가 끝날 때쯤에는 자연스럽게 3~4가지가 연결되어 있을 것이다.

**오해 3 — "Subagent는 AI를 여러 개 동시에 켜는 것이라 비용이 많이 든다"**

병렬 처리라서 일부 비용이 증가하는 것은 사실이다. 하지만 순차로 처리하는 것과 병렬 처리의 총 비용 차이는 작업에 따라 다르다. Day 3에서 구체적으로 다룬다.

---

## QUIZ

**Q1. Claude Code가 일반 채팅(claude.ai 웹)과 결정적으로 다른 점은 무엇인가?**

```json
AskUserQuestion({
  "questions": [{
    "question": "Claude Code(터미널 버전)와 claude.ai 웹 채팅의 결정적 차이는?",
    "header": "Quiz B5-1-1",
    "options": [
      {"label": "Claude Code가 더 빠른 모델을 사용한다", "description": "모델 속도 차이"},
      {"label": "Claude Code는 폴더·파일·외부 도구를 직접 읽고 수정하며 명령을 실행할 수 있다", "description": "에이전트 능력 차이"},
      {"label": "Claude Code는 한국어를 더 잘 한다", "description": "언어 능력 차이"},
      {"label": "Claude Code는 유료이고 웹은 무료다", "description": "비용 구조 차이"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번

해설: Claude Code는 "에이전트"다. 에이전트는 단순히 답을 내놓는 것을 넘어 **환경에 접근하고 행동을 취할 수 있다.** 폴더의 파일을 읽고, 터미널 명령을 실행하고, 외부 도구(MCP)에 접근하는 것이 그 예다. 일반 채팅은 대화 창 안에서 텍스트만 주고받는다. 이 차이가 CLAUDE.md·MCP·스킬이 작동하는 기반이다.

---

**Q2. 7가지 기능 중 "MCP"의 역할은 무엇인가? CSM 업무에서 어디에 쓰이는가?**

```json
AskUserQuestion({
  "questions": [{
    "question": "MCP(Model Context Protocol)가 CSM 업무에서 어떤 역할을 하는가?",
    "header": "Quiz B5-1-2",
    "options": [
      {"label": "AI의 언어 능력을 향상시킨다", "description": "언어 모델 개선"},
      {"label": "Gmail·Notion·Slack 같은 외부 도구를 AI가 직접 읽고 쓸 수 있게 연결한다", "description": "외부 도구 연결"},
      {"label": "스킬(슬래시 명령)을 만드는 방법이다", "description": "스킬과 MCP 혼동"},
      {"label": "CLAUDE.md를 자동으로 생성한다", "description": "/init과 혼동"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번

해설: MCP(Model Context Protocol)는 AI가 외부 도구에 직접 접근할 수 있게 하는 "포트"다. Gmail MCP를 켜면 "지난주 고객 A 메일 요약해줘"가 실제로 메일을 읽고 요약한다. CLAUDE.md는 고정 맥락을 제공하는 것이고, MCP는 실시간으로 변하는 맥락(지금 막 온 메일, 오늘 Slack 논의)을 AI가 읽을 수 있게 한다. Day 2의 핵심이다.

---

**Q3. 4일 캠프에서 7가지 기능을 배우는 순서가 CLAUDE.md → MCP → 스킬 → 검증인 이유는?**

```json
AskUserQuestion({
  "questions": [{
    "question": "Day 1에서 CLAUDE.md부터 시작하는 이유는 무엇인가?",
    "header": "Quiz B5-1-3",
    "options": [
      {"label": "CLAUDE.md가 가장 어렵기 때문에 먼저 한다", "description": "난이도 기준"},
      {"label": "CLAUDE.md가 다른 모든 기능(MCP·스킬·Subagent)의 기반이 되는 기본값 레이어이기 때문", "description": "레이어 구조 관점"},
      {"label": "MCP를 먼저 하면 보안 위험이 있기 때문", "description": "보안 기준"},
      {"label": "순서는 중요하지 않다 — 어디서 시작해도 동일하다", "description": "순서 무관 주장"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번

해설: CLAUDE.md는 AI가 "우리 팀을 아는 상태"를 만드는 기반이다. MCP로 Gmail을 연결해도 AI가 우리 팀 톤을 모르면 요약이 일반적이다. 스킬을 만들어도 CLAUDE.md의 금지어·고객 맥락이 없으면 스킬 결과도 일반적이다. **기본값(CLAUDE.md)이 있어야 그 위에 쌓이는 모든 것이 "우리 것"이 된다.** 이것이 Day 1이 CLAUDE.md인 이유다.