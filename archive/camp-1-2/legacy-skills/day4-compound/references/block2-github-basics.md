# Block 2: GitHub 기초

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/github-actions
> 📖 일반 워크플로우: https://code.claude.com/docs/ko/common-workflows
> ```

## EXPLAIN

**"기록 없이는 복리가 안 된다"**

CLAUDE.md, 스킬, MCP 설정도 한 줄 바꾸면 결과가 달라집니다. 변경을 기록하고 되돌릴 수 있어야 복리 효과를 얻습니다.

### GitHub이란?

**한 줄 정의:** 저장 + 공유 + 변경 이력 + 협업 리뷰 플랫폼

- Google Drive의 "변경 이력 + 협업" 강화 버전
- 2025년 기준 1.8억 명 사용
- 코드뿐 아니라 CLAUDE.md, 스킬, MCP 설정도 관리 가능

### 핵심 기능 4가지

| 기능 | 비유 | 설명 |
|------|------|------|
| **Repository** | 프로젝트의 집 | 모든 파일이 사는 곳 |
| **Commit** | 게임 세이브 | 잘 되는 시점에 저장 + 왜 바꿨는지 메모 |
| **Branch** | 실험용 복사본 | 원본 안 건드리고 시도 |
| **Pull Request** | 결재 문서 | "이렇게 바꿔봤는데 봐줘" |

### git 명령어 비유

| 명령어 | 비유 |
|--------|------|
| `git clone` | Google Drive에서 폴더 다운로드 |
| `git commit` | 게임 세이브 |
| `git branch` | A안, B안 동시 작업 |
| `git push` | Google Drive에 업로드 |

**핵심:** git = 실행 취소의 끝판왕. 뭘 해도 돌아갈 수 있다.

### 비개발자 핵심 포인트

- 명령어 외울 필요 없음 → **Claude에게 말로 시키면 됨**
- 개념만 이해하면 OK
- "최근 커밋 보여줘", "git 상태 확인해줘" 이렇게 말하면 됨

> 명령어를 외울 필요 없습니다. Claude에게 말로 시키면 됩니다.

## EXECUTE

**Step 1: git 상태 확인**

Claude에게 요청해보세요:
```
현재 디렉토리의 git 상태를 확인해줘
```

**Step 2: git 커밋 히스토리 보기**

```
최근 git 커밋 5개를 보여줘
```

> git이 초기화되지 않은 프로젝트라면 Claude가 안내해줍니다. 개념 이해가 우선이므로 넘어가도 괜찮습니다.
