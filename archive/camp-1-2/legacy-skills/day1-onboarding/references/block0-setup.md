# Block 0: Setup — 환경 확인

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/setup
> ```

## EXPLAIN

안녕하세요! **AI Native Camp Day 1**에 오신 것을 환영합니다.

오늘은 AI 시대에 일하는 방식이 어떻게 바뀌고 있는지 이해하고, Claude Code를 직접 체험해봅니다.

시작하기 전에 환경이 잘 세팅되어 있는지 확인하겠습니다.

### 어디서 실행하나요?

**터미널**(Terminal)이라는 프로그램을 사용합니다.

- **Mac**: `Cmd + Space` → "터미널" 검색 → 실행
- **Windows**: `Win + R` → `cmd` 입력 → 실행
- **VS Code 사용자**: 하단 터미널 패널 (`Ctrl + ~`)

> 터미널 = 텍스트로 컴퓨터와 대화하는 창입니다. 마우스 대신 글자를 입력해서 명령합니다.

### 설치 (아직 안 했다면)

| OS | 명령어 |
|----|--------|
| Mac / Linux | `curl -fsSL https://claude.ai/install.sh \| bash` |
| Windows (PowerShell) | `irm https://claude.ai/install.ps1 \| iex` |

Node.js 불필요. 한 줄이면 끝.

| 문제 | 해결 |
|------|------|
| 권한 에러 (Mac) | 터미널을 닫고 다시 열어서 재시도 |
| 설치 후 `claude` 명령 안 됨 | 터미널을 껐다 다시 열기 (새 터미널 세션 필요) |
| Windows에서 실행 정책 에러 | `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser` 실행 후 재시도 |

### 에디터 (선택사항)

Claude Code는 터미널에서 `claude`만 치면 됩니다. 파일을 눈으로 보면서 작업하고 싶다면:

| 에디터 | 특징 | 추천 대상 |
|--------|------|-----------|
| [Cursor](https://www.cursor.com/) | AI 내장, Claude Code와 시너지 | 코드 편집도 할 분 |
| [VS Code](https://code.visualstudio.com/) | 가장 범용적 | 이미 쓰고 계신 분 |

> 이 캠프에서는 에디터 없이 터미널에서 `claude`만 쳐도 충분합니다.

## EXECUTE

아래 명령어를 **터미널**에 한 줄씩 입력하고 Enter를 눌러보세요.

**Step 1: Claude Code가 설치되어 있는지 확인**
```bash
claude --version
```
→ `1.x.x` 같은 버전 번호가 나오면 정상입니다.
→ "command not found"가 나오면 설치가 필요합니다: `npm install -g @anthropic-ai/claude-code`

**Step 1.5: Claude Code 첫 실행 + 로그인**
```
claude
```
→ 처음 실행하면 Anthropic 계정 로그인 화면이 나옵니다. 브라우저가 열리면 로그인하세요.
→ 로그인 후 "안녕, 나는 [이름]이야. 인사해줘"라고 대화해보세요. 답변이 오면 정상입니다!

### Mac 꿀팁: 숨겨진 폴더 보기

Mac에서는 `.`으로 시작하는 폴더(`.claude`, `.git` 등)가 기본적으로 보이지 않습니다. Claude Code에게 이렇게 말하면 설정해줍니다:

```
Finder에서 숨겨진 폴더(.claude, .git 등)도 보이게 설정해줘
```

**Step 2: 지금 내가 어느 폴더에 있는지 확인**
```bash
pwd
```
→ `pwd`는 "Print Working Directory"의 약자로, **지금 터미널이 보고 있는 폴더 위치**를 알려줍니다.
→ Claude Code는 이 폴더를 기준으로 파일을 읽고 쓰기 때문에, 작업할 폴더에서 시작하는 게 중요합니다.

**Step 3: 이 폴더에 CLAUDE.md가 있는지 확인**
```bash
ls CLAUDE.md
```
→ 아직 없는 게 정상입니다! CLAUDE.md는 오늘 Block 3에서 직접 만들 예정입니다.
→ 왜 확인하냐면: CLAUDE.md는 Claude가 **매 대화를 시작할 때 자동으로 읽는 파일**이라서, 나중에 이 파일이 있는지 없는지가 Claude의 동작에 큰 영향을 줍니다.

> 환경 확인이 끝나면 본격적으로 시작합니다.
