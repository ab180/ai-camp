> 📖 공식 문서: https://vercel.com/docs

## EXPLAIN

### 핵심 한 줄

Vercel = GitHub repo를 **공개 URL**로 자동 배포해주는 서비스. 본인 CLAUDE.md/스킬을 팀 외부에 공유하거나, 신규 입사자 온보딩 페이지로 만들 때 5분이면 끝난다.

---

### 1. 무엇·왜·언제

**무엇**: GitHub repo를 push만 하면 `https://본인이름.vercel.app`처럼 공개 URL로 자동 배포. 정적 사이트(HTML/MD)·Next.js·React 등 지원.

**왜 CSM에게?**
- 본인 CLAUDE.md를 **팀 외부 공유 페이지**로: "내가 일하는 방식" 한 페이지를 URL로 보내기
- **신규 입사자 온보딩**: "이 URL 읽고 시작하세요" — Notion 권한 안 줘도 됨
- **공용 스킬 카탈로그**: 팀 repo의 README.md를 URL로 → 검색·공유·인용 쉬움

**언제 안 쓰나?**
- 민감 정보(고객 이름·계약 조건)가 있는 CLAUDE.md → Vercel 공개 X. 사내 도구만.
- 팀 내 협업만 → GitHub만으로 충분

---

### 2. 가입 + 1번 배포 (5분 가이드)

**Step 1 — 가입 (1분)**
- vercel.com 접속 → "Sign up with GitHub"
- GitHub 계정 권한 승인
- Hobby 플랜 (무료) 선택

**Step 2 — repo 연결 (2분)**
- Dashboard → "Add New" → "Project"
- 본인 GitHub repo 선택 (예: 어제 PR 올린 팀 repo 또는 본인 개인 repo)
- "Import" 클릭
- Framework Preset: 정적 마크다운이면 "Other" 선택
- "Deploy" 클릭

**Step 3 — URL 받기 (1분)**
- 30초 후 배포 완료
- `https://repo이름-본인.vercel.app` URL 자동 생성
- 클릭해서 확인

**Step 4 — 자동 재배포 (1분)**
- 이후 GitHub에 push할 때마다 자동 재배포
- 별도 명령 X

---

### 3. CSM 활용 — 본인 CLAUDE.md를 팀 공개 페이지로

**시나리오 — 신규 입사자 온보딩 페이지**

본인 CLAUDE.md에 담긴 "담당 고객 톤·금지어·작업 흐름"을 신규 입사자에게 공유하고 싶다. Notion보다 가벼운 방식.

```
1. 팀 repo에 onboarding/yechan.md 생성
2. 본인 CLAUDE.md의 공개 가능 섹션만 복붙 (민감 고객명 X)
3. git commit + push
4. Vercel이 자동 배포 → URL 받음
5. 신규 입사자에게 URL 1개 보냄
```

**시나리오 — 공용 스킬 카탈로그**

팀 repo의 SKILL 목록을 README.md에 정리하면 → Vercel이 그걸 공개 URL로 → 다른 팀이 "이 팀은 어떤 스킬 쓰나" 검색 가능.

**시나리오 — 본인 작업 방식 한 페이지 포트폴리오**

`https://yechan.vercel.app` — 본인 CLAUDE.md를 자신의 "AI와 일하는 방식" 공개 포트폴리오로. 다른 회사 CSM과 교류 시 URL 1개로 본인 워크플로우 공유.

---

### 4. 흔한 오해

**오해 1 — "Vercel은 개발자 전용"**

아니다. 정적 마크다운/HTML은 코드 없이 배포 가능. CSM이 만든 `.md` 파일도 그대로 공개 URL이 된다.

**오해 2 — "푸시할 때마다 손으로 배포해야 한다"**

자동이다. GitHub push 직후 Vercel이 감지해서 30초 안에 재배포.

**오해 3 — "민감 정보도 자동 가려진다"**

아니다. repo에 push한 모든 내용이 공개된다. 민감 정보는 push 전에 직접 제거하거나 별도 private repo 사용.

---

## EXECUTE

### 지금 직접 해보세요 (10분)

**Step 1 — Vercel 가입**
vercel.com → GitHub로 sign up

**Step 2 — 본인 또는 팀 repo 연결**
Dashboard → Add New → Project → 어제 PR 올린 그 repo 선택 → Deploy

**Step 3 — URL 확인**
배포 후 자동 생성된 URL 클릭 → 본인 README가 공개 페이지로 보이는지 확인

**Step 4 — 한 줄 추가 후 push**
README에 "This is my CSM workflow." 한 줄 추가 → commit → push
1분 후 URL 새로고침 → 자동 반영 확인

**완료 기준**
- [ ] Vercel 계정 생성
- [ ] repo 1개 연결
- [ ] 공개 URL 받음
- [ ] push → 자동 재배포 1번 확인

---

### 주의 사항

- 첫 배포 시 **public 여부** 확인. 본인 CLAUDE.md가 민감 고객명 포함이면 private repo + Vercel 비공개 배포 (유료 플랜 필요)
- `.env` 파일이나 API 키는 절대 push X — Vercel이 그대로 노출
