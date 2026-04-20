# Block 3: 서비스화 — 스킬을 서비스로

> 이 블록은 서비스화 개념 설명이므로 공식 문서 URL이 없습니다.

## EXPLAIN

### 스킬 vs 서비스

| 구분 | 스킬 | 서비스 |
|------|------|--------|
| 비유 | 내 노트북의 글 초안 | 블로그에 발행한 글 |
| 접근성 | 나만 사용 | 누구나 접속 가능 |
| 특징 | 로컬 동작 | URL + 데이터 + API |

### 스킬 공유의 기본: Git

가장 간단한 스킬 공유 방법은 GitHub입니다.

1. 내 스킬을 GitHub에 push
2. 동료가 `git clone` 또는 `ln -sf`로 가져다 쓰기
3. 끝!

이것만으로도 팀 내 스킬 공유가 가능합니다.

### 더 나아가기 (선택): 서비스화

시간이 되면 Vercel + Supabase로 웹 서비스로 만들 수도 있습니다.

### 3가지 인프라 (선택적 심화)

| 인프라 | 비유 | 역할 |
|--------|------|------|
| **GitHub** | 작가의 작업실 | 버전 기록 + 협업 |
| **Vercel** | 자동 발행 시스템 | GitHub에 올리면 → 자동 웹사이트 |
| **Supabase** | 독자 관리 + 데이터 | 방문자, 검색, API |

### 서비스화 플로우

```
스킬 (나만 쓰는 것)
    ↓ "다른 사람도 쓸 수 있게 만들고 싶다"
서비스화 = 스킬에 "살"을 붙이는 것
  • 웹 인터페이스 (Vercel)
  • 데이터 저장 (Supabase)
  • 버전 관리 (GitHub)
    ↓
실제 서비스!
```

### 실제 사례: Skill Directory

- 시작: "스킬 목록을 정리하고 싶다"
- 결정: "다른 사람도 검색하고 찾을 수 있게 하자"
- 구성: GitHub(코드) + Vercel(웹사이트) + Supabase(스킬 DB)
- 확장: 실시간 검색, 투표/설치 추적, 트렌딩 정렬
- 결과: 400개+ 스킬, 누구나 접속 가능

> 지금 당장 서비스화할 필요는 없습니다. 개념만 이해하면 됩니다.

## EXECUTE

**서비스화 명령어 탐색**

Claude에게 아래 중 하나를 요청해보세요:

- "이 프로젝트를 Vercel에 배포할 수 있게 설정해줘" (Vercel)
- "Supabase에 연결해서 데이터를 저장하는 코드 만들어줘" (Supabase)

→ 실제 배포하지 않아도 괜찮습니다. Claude가 어떤 설정 파일을 만드는지 구조만 확인해보세요.

## QUIZ

**Q1. Vercel의 역할을 가장 잘 설명한 것은?**

```json
{
  "questions": [{
    "question": "Vercel의 역할을 가장 잘 설명한 것은?",
    "header": "Q1",
    "options": [
      {"label": "데이터를 저장하는 곳", "description": "데이터 저장?"},
      {"label": "GitHub에 올리면 자동으로 웹사이트로 배포하는 시스템", "description": "자동 배포"},
      {"label": "코드를 작성하는 도구", "description": "코드 에디터?"},
      {"label": "이메일을 보내는 서비스", "description": "이메일?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (자동 배포)
해설: Vercel은 GitHub에 코드를 올리면 자동으로 웹사이트로 배포해주는 "자동 발행 시스템"입니다.

**Q2. 스킬과 서비스의 가장 큰 차이는?**

```json
{
  "questions": [{
    "question": "스킬과 서비스의 가장 큰 차이는?",
    "header": "Q2",
    "options": [
      {"label": "파일 형식", "description": "파일 타입?"},
      {"label": "나만 사용 vs 누구나 접속 가능", "description": "접근성 차이"},
      {"label": "프로그래밍 언어", "description": "언어 차이?"},
      {"label": "실행 속도", "description": "속도?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (접근성 차이)
해설: 스킬은 로컬에서 나만 쓰는 것, 서비스는 URL로 누구나 접속할 수 있는 것입니다.

**Q3. 비개발자가 서비스화를 할 때 가장 좋은 방법은?**

```json
{
  "questions": [{
    "question": "비개발자가 서비스화를 할 때 가장 좋은 방법은?",
    "header": "Q3",
    "options": [
      {"label": "직접 코드를 학습하여 구현", "description": "코딩 공부?"},
      {"label": "Claude에게 말로 시켜서 구현", "description": "AI에게 요청"},
      {"label": "외부 개발자를 고용", "description": "외주?"},
      {"label": "서비스화를 포기", "description": "포기?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (Claude에게 요청)
해설: Claude에게 "Vercel에 배포해줘", "Supabase에 연결해줘"라고 말하면 됩니다.
