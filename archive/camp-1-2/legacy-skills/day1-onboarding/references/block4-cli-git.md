# Block 4: CLI + git 기초

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/cli-reference
> ```

## EXPLAIN

### 터미널 = 텍스트로 컴퓨터랑 대화하는 카카오톡

외울 명령어는 5개면 충분합니다:

| 명령어 | 비유 | 의미 |
|--------|------|------|
| `cd 폴더명` | 폴더 더블클릭 | 폴더 이동 |
| `ls` | 폴더 열어보기 | 목록 보기 |
| `pwd` | 주소창 보기 | 현재 위치 |
| `cat 파일명` | 메모장으로 열기 | 파일 내용 보기 |
| `open 파일명` | 더블클릭 | 파일/폴더 열기 (Mac) |

> 나머지는 Claude에게 말로 시키면 됩니다!

### git = 실행 취소의 끝판왕

| 동작 | 비유 |
|------|------|
| `git clone` | Google Drive에서 폴더 다운로드 |
| `git commit` | 게임 세이브 |
| `git branch` | A안, B안 동시 작업 |
| `git push` | Google Drive에 업로드 |

### GitHub = 코드의 Google Drive

| 개념 | 비유 | 설명 |
|------|------|------|
| Repository | Google Drive 폴더 | 프로젝트 파일들이 모여있는 곳 |
| Pull Request | "이렇게 바꿨는데 괜찮아?" | 변경사항 리뷰 요청 |
| Merge | "오케이, 합치자" | 리뷰 통과 후 반영 |

**핵심 포인트:**
- git = 뭘 해도 돌아갈 수 있음 (실험을 두려워하지 마세요)
- GitHub = 협업의 허브 (혼자가 아니라 함께)

### 비개발자 FAQ

**Q: 터미널이 무서워요** → 카카오톡처럼 텍스트로 대화하는 창일 뿐. Claude가 대신 명령어를 입력해줍니다.

**Q: 명령어를 다 외워야 하나요?** → 5개만 알면 충분. 나머지는 Claude가 다 해줍니다.

**Q: 잘못 입력하면 컴퓨터가 망가지나요?** → git을 쓰면 언제든 이전 상태로 돌아갈 수 있습니다. 게임 세이브처럼요.

## EXECUTE

**CLI 체험**

터미널에서 아래 명령어를 하나씩 입력해보세요:
```bash
pwd          # 현재 위치 확인
ls           # 파일 목록 보기
cat CLAUDE.md  # CLAUDE.md 내용 보기
```

**Claude에게 git 시키기**

```
현재 디렉토리의 git 상태를 확인해줘
```
→ Claude가 `git status` 등을 실행합니다. 명령어를 몰라도 됩니다!

## QUIZ

**Q1. 터미널에서 현재 위치를 확인하는 명령어는?**

```json
{
  "questions": [{
    "question": "터미널에서 현재 위치를 확인하는 명령어는?",
    "header": "Q1",
    "options": [
      {"label": "ls", "description": "파일 목록을 보는 명령어"},
      {"label": "cd", "description": "폴더를 이동하는 명령어"},
      {"label": "pwd", "description": "현재 위치를 출력하는 명령어"},
      {"label": "cat", "description": "파일 내용을 보는 명령어"}
    ],
    "multiSelect": false
  }]
}
```
정답: 3번 (pwd)
해설: pwd = Print Working Directory, 현재 어디에 있는지 알려줍니다.

**Q2. git commit의 비유로 가장 적절한 것은?**

```json
{
  "questions": [{
    "question": "git commit의 비유로 가장 적절한 것은?",
    "header": "Q2",
    "options": [
      {"label": "파일 삭제", "description": "삭제와 관련?"},
      {"label": "게임 세이브", "description": "현재 상태를 저장"},
      {"label": "폴더 이동", "description": "이동과 관련?"},
      {"label": "인터넷 검색", "description": "검색과 관련?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (게임 세이브)
해설: commit은 현재 상태를 저장하는 것입니다. 언제든 이 시점으로 돌아올 수 있습니다.

**Q3. CLI 명령어를 다 외워야 하나요?**

```json
{
  "questions": [{
    "question": "CLI 명령어를 다 외워야 하나요?",
    "header": "Q3",
    "options": [
      {"label": "반드시 외워야 한다", "description": "모든 명령어 암기?"},
      {"label": "기본 5개만 알면 나머지는 Claude에게 시키면 된다", "description": "핵심만 알고 나머지는 AI에게"},
      {"label": "100개 이상 외워야 한다", "description": "많이 알수록 좋다?"},
      {"label": "외울 필요 없이 GUI만 쓰면 된다", "description": "GUI로 충분?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (기본 5개만 알면 나머지는 Claude에게 시키면 된다)
해설: cd, ls, pwd, cat, open 5개만 알면 충분합니다. 나머지는 Claude가 해줍니다.

### 더 배우고 싶다면

| 리소스 | 설명 | 링크 |
|--------|------|------|
| git 간편 안내서 | 그림으로 쉽게 배우는 git | https://rogerdudler.github.io/git-guide/index.ko.html |
| Learn Git Branching | 시각적으로 git을 체험하는 게임 | https://learngitbranching.js.org/?locale=ko |

> 지금 다 알 필요는 없습니다. 나중에 궁금할 때 찾아보세요.
