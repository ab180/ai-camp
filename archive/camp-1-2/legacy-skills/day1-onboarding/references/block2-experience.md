# Block 2: Experience — Claude Code 첫 체험

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/setup
> ```

## EXPLAIN

개념을 배웠으니 이제 직접 체험할 차례입니다. Claude Code에게 간단한 작업을 시켜보겠습니다.

**Claude Code = 내 컴퓨터에 출근한 AI**
- 웹의 Claude는 브라우저에서 대화만 함
- Claude Code는 **내 컴퓨터에서 파일을 보고, 만들고, 수정**함

**웹 Claude와의 차이:**
- 웹 Claude: 브라우저에서 대화만 → "글 써줘" → 화면에 표시
- Claude Code: 내 컴퓨터에서 직접 동작 → "파일 만들어줘" → 실제 파일 생성

## EXECUTE

**체험 1: Claude에게 자기소개 시키기**

아래 내용을 Claude Code에 입력해보세요:
```
너에 대해 간단히 소개해줘. 어떤 도구를 사용할 수 있는지 3가지만 알려줘.
```

**체험 2: 파일 만들기**

```
hello.md 라는 파일을 만들어줘. 내용은 "AI Native Camp Day 1 시작!" 이라고 적어줘.
```
→ Claude가 파일을 만든 후, 직접 확인:
```bash
cat hello.md
```

**체험 3: 파일 수정하기**

```
hello.md에 오늘 날짜와 "CLAUDE.md를 만들 예정" 이라는 내용을 추가해줘.
```
→ 수정된 내용 확인:
```bash
cat hello.md
```

> 이렇게 Claude Code는 말로 시키면 파일을 만들고 수정합니다. GUI 없이 텍스트만으로!
