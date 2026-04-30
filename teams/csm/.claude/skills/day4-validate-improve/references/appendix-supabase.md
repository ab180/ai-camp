> 📖 공식 문서: https://supabase.com/docs

## EXPLAIN

### 핵심 한 줄

Supabase = **팀 공용 데이터베이스 + API**. 무료 + UI 기반. 본인 스킬이 만든 결과·신호·메모를 팀이 같이 읽고 쓸 수 있게 만든다. Claude도 MCP로 직접 접근 가능.

---

### 1. 무엇·왜·언제

**무엇**: PostgreSQL 데이터베이스 + REST API + 인증을 5분이면 띄우는 서비스. 코드 없이 UI에서 테이블 만들고 데이터 쌓는다.

**왜 CSM에게?**
- 팀 공용 **케이스 DB**: "이런 고객 문의는 이렇게 답변" 데이터를 팀이 같이 쌓음
- 본인 **wrap 신호 누적 저장소**: 매 세션 신호를 로컬 파일이 아니라 팀 DB로 → 팀 전체 패턴 분석
- 스킬 **실행 로그**: "오늘 어떤 스킬 몇 번 호출됐나" 자동 누적

**언제 안 쓰나?**
- 1인 작업 → 로컬 파일이 더 가볍다
- 사내 보안 정책상 외부 클라우드 DB 금지 → 안 됨

---

### 2. 가입 + 테이블 만들기 + API 키 (5분 가이드)

**Step 1 — 가입 (1분)**
- supabase.com → "Start your project"
- GitHub로 가입
- Free 플랜 선택

**Step 2 — 프로젝트 생성 (1분)**
- "New Project" → 프로젝트 이름 (예: `csm-shared`)
- Database 비밀번호 설정 (안전한 곳에 저장)
- Region: `Northeast Asia (Seoul)` 또는 `Tokyo`
- "Create" 클릭 → 1분 대기

**Step 3 — 첫 테이블 만들기 (2분)**
- 좌측 "Table Editor" → "New table"
- Table name: `cases`
- 컬럼:
  - `id` (uuid, primary key, 기본값)
  - `customer_type` (text)
  - `inquiry` (text)
  - `response` (text)
  - `created_at` (timestamp, 기본값 now())
- "Save"

**Step 4 — API 키 받기 (1분)**
- 좌측 "Project Settings" → "API"
- `anon public` 키 복사 → 본인 노트에 저장

이제 Claude나 다른 도구가 이 테이블에 데이터를 읽고 쓸 수 있다.

---

### 3. CSM 활용 — Claude가 직접 읽고 쓰기

**시나리오 1 — 팀 공용 케이스 DB**

CSM 6명이 만나는 고객 케이스를 한 곳에 누적. Claude가 새 문의 받으면:

```
1. 본인이 Claude에 문의 텍스트 보냄
2. Claude가 Supabase MCP로 cases 테이블 검색 ("비슷한 사례")
3. 가장 가까운 사례 3개를 컨텍스트로 받아 답변 작성
4. 본인이 답변 보낸 후 새 row로 cases에 INSERT
```

다음 사람이 비슷한 케이스 만나면 본인 답변이 참고가 된다.

**시나리오 2 — wrap 신호 팀 누적**

본인 wrap이 매 세션 끝에 신호를 로컬 파일에 쌓는다. 이걸 Supabase 테이블로 옮기면 팀 전체 신호가 누적된다.

```
patterns 테이블:
- user (CSM 이름)
- pattern (반복된 결함)
- count (반복 횟수)
- timestamp
```

매주 한 번 팀이 같이 보면서 "팀 전체에 3회 이상 반복된 패턴"을 공용 rules/에 박는다 = 팀 단위 Compound 사이클.

**시나리오 3 — 스킬 실행 로그**

어떤 스킬이 자주 쓰이고 어떤 게 안 쓰이는지 데이터로 본다. 안 쓰이는 스킬은 정리, 자주 쓰이는 스킬은 공용 자산화.

---

### 4. Claude Code에서 Supabase 연결 — 2가지 방법

**방법 A: Supabase MCP (권장)**

```
claude.ai → Settings → Integrations → Supabase
→ Project URL + anon key 입력
→ Connect
→ Claude Code에서 /mcp 확인
```

이제 자연어로: "cases 테이블에서 SaaS 관련 문의 5개 보여줘"

**방법 B: SDK 직접 호출 (개발자용)**

`@supabase/supabase-js` 패키지로 직접. CSM은 보통 A 방법.

---

### 5. 흔한 오해

**오해 1 — "Supabase는 개발자만"**

아니다. UI에서 테이블 만들고 데이터 추가 가능. SQL 몰라도 시작 가능.

**오해 2 — "데이터가 외부에 노출된다"**

기본 설정은 RLS(Row Level Security) 켜져 있어서 인증 안 된 요청 차단. 다만 **anon key를 GitHub에 공개 push 금지**. `.env`에만.

**오해 3 — "고객 데이터 다 넣어도 된다"**

회사 보안 정책 확인 필수. 외부 클라우드 DB 사용 금지면 Supabase 대신 사내 DB 검토.

---

## EXECUTE

### 지금 직접 해보세요 (15분)

**Step 1 — Supabase 가입 + 프로젝트 생성** (3분)
supabase.com → GitHub 가입 → "New Project" → 이름·비밀번호·Seoul region

**Step 2 — `cases` 테이블 생성** (3분)
Table Editor → New table → 컬럼 4개 (id, customer_type, inquiry, response)

**Step 3 — UI에서 row 1개 추가** (2분)
"Insert row" → 샘플 데이터 입력

**Step 4 — Claude Code에서 MCP 연결** (5분)
claude.ai → Settings → Integrations → Supabase → URL + key
Claude Code: `/mcp` → supabase active 확인

**Step 5 — 자연어로 조회** (2분)
"cases 테이블 row 1개 보여줘" → 결과 확인

**완료 기준**
- [ ] Supabase 프로젝트 1개 생성
- [ ] cases 테이블 + row 1개
- [ ] anon key 본인 안전한 곳 저장
- [ ] Claude Code에서 MCP 연결 active
- [ ] 자연어로 row 조회 성공

---

### 주의 사항

- **anon key는 .env에만**. GitHub에 push 금지. 노출되면 즉시 Supabase에서 재생성
- 회사 보안 정책에 따라 **고객 PII 저장 금지**일 수 있음. 미확인 상태면 가짜 데이터로만 실습
