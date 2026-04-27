> Phase A 시작 시 반드시 아래 형태로 출력한다:
> ```
> 📖 공식 문서: https://docs.github.com/ko/pull-requests
> 📖 추가 자료: https://git-scm.com/book/ko/v2
> ```

## EXPLAIN

### 1. 핵심 한 줄
Git은 텍스트 파일(CLAUDE.md·스킬)을 팀이 함께 관리하는 도구다. 코드 작성용이 아니라 "내 것을 팀에게 안전하게 넘기는 법"이다.

---

### 2. 슬라이드 흐름 따라 개념 풀이

**왜 CSM이 Git을 써야 하는가**

세 가지 이유가 있다.

1. **버전 관리**: 3개월 전 CLAUDE.md로 돌아갈 수 있다. "이 스킬 왜 바뀌었지?"를 커밋 기록으로 추적할 수 있다.
2. **공유**: 내가 만든 스킬을 팀이 이메일이나 Slack 붙여넣기 없이 `clone` 한 번으로 바로 받는다.
3. **기여**: 팀원이 내 스킬을 개선해서 PR로 돌려준다. 복리의 단위가 팀이 된다.

**5가지 명령어 — 이것만 알면 된다**

| 명령어 | 한 줄 설명 | 언제 쓰는가 |
|--------|---------|-----------|
| `git clone` | 남의 repo를 내 로컬에 복제 | 공용 스킬 처음 받을 때 |
| `git pull` | 최신으로 갱신 | 팀이 수정한 것을 내 로컬에 반영 |
| `git commit` | 변경사항을 "스냅샷"으로 저장 | 오늘 내가 한 작업 박제 |
| `git push` | 내 커밋을 Github에 올림 | 팀이 볼 수 있게 |
| PR (Pull Request) | 내 변경을 팀 repo에 "합쳐줘" 요청 | 리뷰 후 merge |

나머지 명령어(branch, rebase 등)는 2주 프로젝트에서 자연스럽게 익힌다.

**커밋 메시지 형식**

```
feat: 담당 고객 B 맥락 추가
fix: 금지어 섹션 오타 수정
docs: 워크플로우 설명 보완
```

`<type>: <무엇을 했나>` 형식이다. type은 feat(추가), fix(수정), docs(문서), refactor(재구성) 중 선택.

**개인 → 팀 흐름 (5단계)**

```
1. git clone <팀 repo>       ← 처음 한 번
2. 파일 수정 (CLAUDE.md 섹션 추가 등)
3. git commit -m "feat: 담당 고객 B 맥락 추가"
4. git push                  ← Github에 올림
5. Github에서 PR 생성 → 짝꿍 리뷰 → merge
```

**PR (Pull Request) 이란**

PR은 "내 수정을 팀 repo에 합쳐줘"라는 요청이다. Github 웹에서 버튼 클릭으로 만든다.

PR이 담는 것:
- 무엇이 바뀌었나 (diff 자동 생성)
- 왜 바꿨나 (내가 설명 작성)
- 누가 리뷰할지 (리뷰어 지정)

리뷰어가 승인하면 merge. 팀 repo에 반영 완료. 코드뿐 아니라 CLAUDE.md 문단 추가도 같은 흐름이다.

---

### 3. CSM 일상 적용

**시나리오 1 — 새 스킬을 팀에 공유**

내가 만든 리캡 메일 스킬을 팀이 바로 쓸 수 있게 하려면:
1. `git push`로 Github에 올리고
2. PR을 만들어 팀장을 리뷰어로 지정
3. 승인되면 팀원 모두가 `git pull`로 받아서 쓴다

이메일로 파일을 보내거나 Slack에 붙여넣는 것보다 훨씬 안전하고 버전 추적이 된다.

**시나리오 2 — 팀원이 내 스킬을 개선해서 PR로 보내줌**

팀원이 내 스킬의 금지어 섹션을 개선한 뒤 PR을 보내주면, 내가 리뷰하고 merge하면 개선이 적용된다. 개선이 팀 전체에 즉시 반영된다.

**시나리오 3 — 예전 CLAUDE.md로 돌아가고 싶을 때**

커밋 기록이 있으면 "2주 전 상태"로 돌아갈 수 있다. CLAUDE.md를 잘못 수정했을 때 복구가 쉽다.

---

### 4. 흔한 오해

**오해 1 — "Git은 개발자가 코드 관리하는 도구라 CSM에게 필요 없다"**

Git은 "텍스트 파일 버전 관리 도구"다. 코드도 텍스트이고, CLAUDE.md와 스킬 파일도 텍스트다. 원리는 동일하다. 오늘 우리가 쓰는 5가지 명령어는 개발 지식 없이 쓸 수 있다.

**오해 2 — "commit하면 바로 팀 repo에 올라간다"**

commit은 내 로컬에만 저장된다. Github에 올리려면 `push`가 필요하다. commit → push → (PR → merge) 순서다.

**오해 3 — "PR은 코드 리뷰를 위한 것이라 CLAUDE.md에는 필요 없다"**

PR은 어떤 텍스트 변경이든 "팀이 검토하고 합치는" 절차다. CLAUDE.md의 금지어 1개를 추가하는 것도 PR로 올리면 팀원이 리뷰하고 개선 의견을 남길 수 있다. 변경 이력도 남는다.

---

## EXECUTE

### 지금 직접 해보세요

**오늘 밤 과제: PR 1개 올리기**

1. 운영진이 준비한 팀 repo `clone`
   ```
   git clone <운영진이 알려준 repo URL>
   cd <repo 이름>
   ```

2. `members/<내이름>.md` 파일 만들기 (내 CLAUDE.md에서 담당 고객 섹션 복사)

3. commit:
   ```
   git add members/<내이름>.md
   git commit -m "feat: <내이름> 담당 고객 맥락 추가"
   ```

4. push:
   ```
   git push
   ```

5. Github 웹에서 PR 만들기:
   - "Compare & pull request" 버튼 클릭
   - 제목: `feat: <내이름> 담당 고객 맥락 추가`
   - 리뷰어: 짝꿍 지정

**막혔을 때**:
- `git: command not found` → Git 설치 필요. 운영진에게 요청.
- `permission denied` → repo 접근 권한 확인. 운영진에게 요청.
- push 후 Github에 안 보임 → 올바른 repo에 push했는지 확인

---

## QUIZ

**Q1. `git commit`과 `git push`의 차이는?**

```json
AskUserQuestion({
  "questions": [{
    "question": "git commit을 했다. 팀원이 내 변경사항을 바로 볼 수 있는가?",
    "header": "Quiz Day2-B5-1",
    "options": [
      {"label": "볼 수 있다 — commit하면 Github에 자동 업로드된다", "description": "commit과 push 혼동"},
      {"label": "볼 수 없다 — push를 해야 Github에 올라간다", "description": "commit은 로컬, push는 원격"},
      {"label": "볼 수 있다 — 인터넷에 연결되어 있으면 자동 동기화된다", "description": "자동 동기화 오해"},
      {"label": "볼 수 없다 — PR까지 해야 올라간다", "description": "PR과 push 혼동"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번

해설: `git commit`은 내 로컬에 변경사항을 저장하는 것이다(스냅샷). Github에는 아무것도 올라가지 않는다. `git push`를 해야 내 commit이 Github에 올라가고 팀원이 볼 수 있다. 개발자들이 자주 헷갈리는 지점이기도 하다. commit → push → (PR → merge) 순서를 기억.

---

**Q2. PR을 만드는 주된 목적은 무엇인가?**

```json
AskUserQuestion({
  "questions": [{
    "question": "CLAUDE.md에 금지어 2개를 추가한 뒤 PR을 만든다. PR의 주된 목적은?",
    "header": "Quiz Day2-B5-2",
    "options": [
      {"label": "파일을 더 빠르게 Github에 올리기 위해", "description": "업로드 속도 목적"},
      {"label": "팀원이 변경 내용을 리뷰하고 의견을 남긴 뒤 merge할 수 있도록", "description": "리뷰·협업 목적"},
      {"label": "Git이 PR 없이는 파일을 저장하지 않기 때문", "description": "기술적 필수요건 오해"},
      {"label": "PR은 코드에만 사용하고 텍스트 파일에는 해당 없다", "description": "PR 적용 범위 오해"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번

해설: PR은 "내 수정을 팀에 합쳐줘"라는 요청이면서 동시에 리뷰의 과정이다. 리뷰어가 "이 금지어는 왜 추가했나요?" "이 표현도 추가하면 좋겠어요"라고 코멘트를 달 수 있다. 이 과정이 팀의 CLAUDE.md와 스킬 품질을 높인다. 코드가 아닌 텍스트 파일에도 동일하게 적용된다.

---

**Q3. 커밋 메시지 `feat: 담당 고객 B 맥락 추가`에서 `feat:`의 의미는?**

```json
AskUserQuestion({
  "questions": [{
    "question": "`feat: 담당 고객 B 맥락 추가`에서 feat의 의미와 다른 type의 사용 예는?",
    "header": "Quiz Day2-B5-3",
    "options": [
      {"label": "featured — 중요한 변경임을 표시", "description": "featured의 약자 오해"},
      {"label": "feature — 새 내용 추가를 의미. fix(수정)·docs(문서)·refactor(재구성)도 있다", "description": "feature type과 다른 type들"},
      {"label": "first — 첫 번째 커밋임을 표시", "description": "first의 약자 오해"},
      {"label": "커밋 메시지 형식은 자유라 무관하다", "description": "형식 자유도 주장"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번

해설: `feat`는 feature(기능·내용 추가)의 약자다. `fix`는 오류나 잘못된 내용 수정, `docs`는 문서 보완, `refactor`는 내용은 유지하되 구조 개선. 이 형식을 지키면 나중에 커밋 기록을 볼 때 "어떤 종류의 변경이었는지"를 빠르게 파악할 수 있다. 특히 팀 repo에서 여러 사람이 커밋할 때 형식 통일이 중요하다.