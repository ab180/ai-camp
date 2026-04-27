> Phase A 시작 시 반드시 아래 형태로 출력한다:
> ```
> 📖 공식 문서: https://docs.github.com/ko/pull-requests
> 📖 추가 자료: https://git-scm.com/book/ko/v2
> ```

## EXPLAIN

### 1. 핵심 한 줄
팀 repo는 "Play Store 모델"이다. 한 사람이 올리면 팀 전체가 받아서 쓴다. PR은 그 업로드의 안전망이다.

---

### 2. 슬라이드 흐름 따라 개념 풀이

**왜 팀 공유인가 — 한 사람 개선 = 팀 개선**

내가 스킬의 금지어 섹션을 개선했다. 혼자만 쓰면 혼자만 이득이다. 팀 repo에 올리면 팀원 모두가 바로 쓸 수 있다. 내 30분이 팀 10명의 자산이 된다.

이것이 Day 2에서 배운 Git·PR의 궁극적인 목적이다.

**팀 repo 구조 — Play Store 모델**

```
team-repo/
├── skills/          ← 팀이 함께 쓰는 스킬 모음
│   ├── recap-mail/
│   ├── inquiry-reply/
│   └── meeting-prep/
├── agents/          ← 에이전트 모음 (까다로운 고객 등)
└── README.md        ← 스킬 목록 + 사용 방법
```

Play Store처럼: 누구나 업로드(PR), 누구나 다운로드(git pull). 단, 업로드 전에 리뷰(PR 승인)가 있다.

**README — 6축 태그로 정리**

README에 스킬 목록을 올릴 때 6축 태그로 분류하면 "이 스킬이 어느 축을 담당하는지"가 한눈에 보인다.

예시:
```markdown
## 스킬 목록

| 스킬 | 축 | 설명 | 작성자 |
|-----|---|------|------|
| recap-mail | 4 실행 | 미팅 노트 → 리캡 메일 초안 | OOO |
| inquiry-reply | 4 실행 | 문의 → 답변 초안 | XXX |
| evaluator-enterprise | 5 검증 | 엔터프라이즈 고객 관점 평가 | OOO |
```

**업로드 실습 흐름**

```
1. git clone <팀 repo>
2. skills/<내이름>/ 폴더 + 파일 복사
3. git add skills/<내이름>/
4. git commit -m "feat: <내이름> 리캡 메일 스킬 추가"
5. git push
6. Github PR 생성 + 리뷰어 지정
```

**PR 워크플로우 — 왜 main에 바로 안 올리는가**

main(팀 공용 브랜치)에 직접 올리면 검토 없이 바로 반영된다. 팀원이 만든 스킬에 오류가 있으면 전체에 영향을 준다. PR은 그 안전망이다.

PR → 리뷰어가 확인 → 승인 → merge. 이 흐름이 팀 스킬 품질을 유지한다.

**리뷰어 체크리스트 5가지**

PR 리뷰할 때 확인할 것:
1. README에 6축 태그가 있는가?
2. 스킬이 실제로 돌아가는가? (SKILL.md description 명확)
3. 기존 스킬과 중복되지 않는가?
4. 민감한 고객 정보가 포함되어 있지 않는가?
5. rules/에 톤·금지어·필수 항목이 분리되어 있는가?

---

### 3. CSM 일상 적용

**시나리오 1 — 오늘 1개 업로드 = 팀 자산 +1**

내가 만든 리캡 메일 스킬을 PR로 올린다. 팀장이 승인하면 팀원 전체가 `git pull`로 받아서 내일부터 쓸 수 있다. 이것이 "팀 내재화"다.

**시나리오 2 — 팀원 스킬을 PR로 개선**

팀원의 스킬에서 금지어 섹션이 빠진 것을 발견했다. 내가 직접 추가해서 PR로 올리면, 그 팀원이 리뷰하고 merge한다. 서로 개선하는 구조가 만들어진다.

**시나리오 3 — 신규 팀원 온보딩**

팀 repo가 잘 정리되어 있으면 신규 팀원이 `git clone`만 해도 팀의 스킬 전체를 바로 받아서 쓸 수 있다. 온보딩 시간이 줄어든다.

---

### 4. 흔한 오해

**오해 1 — "팀 repo에 올리면 내 스킬을 남이 마음대로 바꿀 수 있다"**

PR이 그것을 막는다. 누군가 내 스킬을 수정하고 싶으면 PR을 올려야 하고, 내가 리뷰하고 승인해야 merge된다. 동의 없이 바뀌지 않는다.

**오해 2 — "스킬이 완성되기 전에 팀 repo에 올리면 안 된다"**

오히려 70% 상태에서 올리는 것이 낫다. 팀원의 리뷰를 통해 더 빨리 개선된다. PR에 "이 부분을 더 보완할 예정"이라고 적으면 된다. 완성된 것만 올리면 피드백을 늦게 받는다.

**오해 3 — "Git/Github는 개발자만 쓰는 도구다"**

Day 2에서도 다뤘지만, Git은 텍스트 파일을 팀이 함께 관리하는 도구다. CLAUDE.md·스킬·rules/ — 모두 텍스트 파일이다. 코딩 없이 5가지 명령어만으로 팀 공유가 가능하다.

---

## EXECUTE

### 지금 직접 해보세요

**오늘 산출물: 스킬 1개 팀 repo에 PR 올리기**

**Step 1: 팀 repo clone (이미 했다면 skip)**
```
git clone <운영진이 준 팀 repo URL>
cd <repo 이름>
```

**Step 2: 내 스킬 폴더 복사**
```
cp -r ~/Desktop/csm-claude/skills/<내이름> skills/
```

**Step 3: README.md 업데이트**
```markdown
| recap-mail-<내이름> | 4 실행 | 미팅 노트 → 리캡 메일 초안 | <내이름> |
```

**Step 4: commit + push**
```
git add skills/<내이름>/ README.md
git commit -m "feat: <내이름> 리캡 메일 스킬 추가"
git push
```

**Step 5: Github PR 생성**
- "Compare & pull request" 버튼
- 제목: `feat: <내이름> 리캡 메일 스킬 v0.5`
- 리뷰어: 짝꿍 지정
- 내용: 3요소 수정 내용 간략히 + 다음 개선 예정

**막혔을 때**: push 후 Github에 안 보이면 올바른 repo URL인지 확인. 권한 오류는 운영진에게.

---

## QUIZ

**Q1. 팀 repo에서 PR을 거치는 이유는?**

```json
AskUserQuestion({
  "questions": [{
    "question": "스킬을 팀 repo main 브랜치에 바로 올리지 않고 PR을 거치는 이유는?",
    "header": "Quiz Day4-B3-1",
    "options": [
      {"label": "Github 규칙상 main에 직접 push가 안 된다", "description": "기술적 제약"},
      {"label": "검토 없이 오류가 있는 스킬이 팀 전체에 영향을 주는 것을 막기 위한 안전망", "description": "품질 보호·안전망"},
      {"label": "PR이 더 빠르기 때문", "description": "속도 이유"},
      {"label": "팀장만 main에 올릴 수 있는 규칙이 있어서", "description": "권한 규칙"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번

해설: PR은 "내 수정을 합쳐줘" 요청이면서 동시에 검토 단계다. 팀 repo의 스킬을 모두가 쓰기 때문에, 오류가 있는 스킬이 merge되면 팀 전체에 영향을 준다. PR 리뷰에서 "SKILL.md description이 불명확하다", "금지어가 빠졌다" 같은 것을 잡아내서 품질을 유지한다. 슬라이드(S35)에서 "PR은 안전망이자 축 5의 팀 버전"이라고 했다.

---

**Q2. 팀 repo README에 6축 태그로 스킬을 분류하면 어떤 이점이 있는가?**

```json
AskUserQuestion({
  "questions": [{
    "question": "README에 스킬별 6축 태그(구조·맥락·계획·실행·검증·개선)를 붙이는 이유는?",
    "header": "Quiz Day4-B3-2",
    "options": [
      {"label": "보기 좋아서", "description": "시각적 이유"},
      {"label": "새 팀원이 '이 스킬이 어느 축 작업에 쓰이는지'를 빠르게 파악하고, 팀의 6축 커버리지를 한눈에 볼 수 있다", "description": "검색성·커버리지 파악"},
      {"label": "Github 검색에 태그가 필요하다", "description": "기술적 필수요건"},
      {"label": "Anthropic의 요구사항이다", "description": "외부 요구"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번

해설: 6축 태그로 분류하면 "이 팀에 검증 축(축 5) 스킬이 없다"는 것을 바로 알 수 있다. 새 팀원이 "문의 답변 자동화 스킬이 있나?"를 찾을 때 README만 봐도 파악된다. 팀의 스킬 포트폴리오가 어느 축에 집중되고 어느 축이 빈약한지를 팀 단위로 보는 것이 2주 프로젝트 방향 설정에 도움이 된다.

---

**Q3. 신규 팀원이 입사했다. 팀 repo가 잘 정리되어 있으면 어떤 이점이 있는가?**

```json
AskUserQuestion({
  "questions": [{
    "question": "신규 팀원이 팀 repo에서 git clone만 하면 무엇을 얻는가?",
    "header": "Quiz Day4-B3-3",
    "options": [
      {"label": "팀의 모든 고객 정보를 볼 수 있다", "description": "고객 정보 접근"},
      {"label": "팀이 쌓아온 스킬 전체를 바로 받아서 첫날부터 쓸 수 있다", "description": "온보딩 자산"},
      {"label": "팀 CLAUDE.md만 받는다", "description": "CLAUDE.md만 포함 오해"},
      {"label": "Git 권한을 자동으로 받는다", "description": "권한 자동 부여"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번

해설: 팀 repo에는 스킬·에이전트·README가 있다. 신규 팀원이 `git clone`하면 팀이 4일~2주 동안 쌓아온 자산을 한 번에 받는다. 처음부터 만들 필요 없이, 팀의 리캡 메일 스킬·문의 답변 스킬을 바로 쓸 수 있다. 이것이 "한 사람 개선 = 팀 개선"이 온보딩에도 적용되는 방식이다.