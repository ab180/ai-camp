# Block B5: Git + 내 repo + 첫 PR

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 GitHub PR 가이드: https://docs.github.com/ko/pull-requests
> ```

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 GitHub PR 가이드: https://docs.github.com/ko/pull-requests
> ```

## EXPLAIN

### 왜 CSM이 Git을 써야 하나

```
"내 CLAUDE.md · 스킬을 팀에 공유하고 싶다"
→ Slack 파일 공유? → 버전 관리 불가 · 중복 혼란
→ GitHub repo! → 변경 이력 + 팀 공유 + 되돌리기
```

Git/GitHub는 코드만을 위한 게 아니다.
CLAUDE.md, SKILL.md 같은 텍스트 파일도 버전 관리할 수 있다.

### 오늘 이 5개면 충분하다

| 명령어 | 하는 일 | 언제 |
|--------|---------|------|
| `git clone` | 남의 repo를 내 로컬에 복제 | 처음 팀 repo 받을 때 |
| `git pull` | 최신 상태로 갱신 | 팀이 수정한 걸 내 로컬에 반영할 때 |
| `git commit` | 변경사항을 스냅샷으로 박제 | "오늘 작업에 이름 붙여 저장" |
| `git push` | 내 커밋을 GitHub에 올림 | 팀이 볼 수 있게 공개 |
| **PR** | 내 변경을 팀 repo에 합쳐달라는 요청 | GitHub 웹에서 생성 |

### PR 흐름

```
내 브랜치에서 commit → push
      ↓
GitHub 웹에서 PR 생성 (제목 1줄 + 본문 간단히)
      ↓
짝꿍이 리뷰어로 지정됨
      ↓
리뷰 완료 → Merge
```

PR = "내가 바꾼 것, 이게 맞는지 확인해줘" 요청.
협업의 기본 단위.

## EXECUTE

오늘 밤 과제 2가지입니다. 지금 시작할 수 있으면 시작하세요.

**과제 1: 내 GitHub repo 만들기 + 스킬 올리기**

1. github.com → New Repository
2. 이름: `my-csm-skills` (또는 원하는 이름)
3. Public 또는 Private 선택
4. README 초기화 체크

Claude Code 세션에서:
```
내 Claude 스킬 폴더를 GitHub에 올려줘.
repo 주소: [방금 만든 repo URL]
```

**과제 2: 첫 PR 만들기**

```
git checkout -b add-my-first-skill
git add .
git commit -m "feat: 첫 번째 스킬 추가"
git push origin add-my-first-skill
```

GitHub 웹에서 PR 생성:
- 제목: "feat: [스킬 이름] 추가"
- 리뷰어: 짝꿍 지정

## QUIZ

이 블록은 QUIZ 없음. 오늘 밤 과제 안내로 마무리.
