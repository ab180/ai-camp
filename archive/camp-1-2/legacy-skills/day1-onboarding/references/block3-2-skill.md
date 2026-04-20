# Block 3-2: Skill — 반복 작업 레시피

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/skills
> ```

## EXPLAIN

| 항목 | 내용 |
|------|------|
| 비유 | 요리 레시피 — 필요할 때만 꺼내는 반복 업무 자동화 |
| 핵심 | CLAUDE.md는 항상 로딩, Skill은 **필요할 때만** 로딩 (Just-in-time) |
| 호출 | `/스킬이름`으로 호출하면 Claude가 레시피대로 실행 |

### CLAUDE.md vs Skill 차이

```
CLAUDE.md  → 매 세션 시작 시 항상 로딩  (영구 기억)
Skill      → /스킬이름 호출할 때만 로딩  (필요할 때)
```

왜 나눌까? → **컨텍스트 윈도우는 유한**하기 때문. 항상 필요한 건 CLAUDE.md에, 가끔 필요한 건 Skill에 넣는다.

### 실제 스킬 예시: /today

GitHub에 공유된 실제 스킬을 봅시다 (https://github.com/song-yechan/useful_skills):

| 스킬 | 설명 |
|------|------|
| `/today` | 오늘 Google Calendar 일정 확인 |
| `/week` | 이번 주 일정 한눈에 보기 |

`/today`를 실행하면 어떤 일이 벌어질까?
1. MCP 설정이 있는지 확인 → 없으면 자동으로 추가해줌
2. Google 인증이 됐는지 확인 → 안 됐으면 인증 가이드 안내
3. 오늘 일정 조회 → 보기 좋게 테이블로 출력

**스킬 하나가 MCP 연결 + 인증 + 데이터 조회 + 포맷팅을 전부 처리합니다.**

### 스킬 파일 구조

```
.claude/skills/
└── today/                  ← 스킬 이름 = 폴더 이름
    └── SKILL.md            (필수 — 레시피 본문)

.claude/skills/
└── my-skill/               ← 더 복잡한 스킬이면
    ├── SKILL.md            (필수 — 레시피 본문)
    ├── scripts/             (자동화 스크립트)
    ├── references/          (참조 자료)
    └── assets/              (이미지 등)
```

## EXECUTE

### Step 1: 현재 설치된 스킬 확인

Claude에게 요청:
```
내가 설치한 스킬 목록을 보여줘
```

그리고 이 캠프 스킬이 어떤 구조인지 확인:
```
.claude/skills/ 폴더 구조를 보여줘
```

### Step 2: /today 스킬 설치해보기

GitHub에서 실제 스킬을 가져와서 설치해봅시다:

```bash
# 1. 스킬 저장소 클론
git clone https://github.com/song-yechan/useful_skills.git ~/useful_skills

# 2. 스킬 디렉토리에 심볼릭 링크
mkdir -p ~/.claude/skills
ln -sf ~/useful_skills/today ~/.claude/skills/today
ln -sf ~/useful_skills/week ~/.claude/skills/week
```

### Step 3: /today 실행

Claude Code를 재시작한 후:
```
/today
```

처음 실행하면 Google Calendar MCP 설정을 자동으로 안내해줍니다. 안내를 따라 설정하면 오늘 일정이 출력됩니다.

> Google Calendar 설정이 복잡하다면, 지금은 스킬 설치까지만 해도 충분합니다.
> MCP 연결은 Day 2에서 자세히 다룹니다.
