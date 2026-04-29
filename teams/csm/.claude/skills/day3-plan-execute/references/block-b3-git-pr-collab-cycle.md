> 📖 공식 문서: https://docs.github.com/ko/pull-requests

## EXPLAIN

### 1. 핵심 한 줄

어제는 PR을 "올리기"까지 했다면 오늘은 받기 → 답하기 → 머지 → pull까지 **한 바퀴**를 돈다. 5단계 다 굴러봐야 "이제 알겠다"가 된다.

---

### 2. 슬라이드 흐름 따라 개념 풀이

**어제 vs 오늘 — 무엇이 달라지나**

| | 어제 (Day 2) | 오늘 (Day 3) |
|---|---|---|
| 1 | clone | (이미 clone됨) |
| 2 | 파일 수정 | 어제 PR에 받은 코멘트 읽기 |
| 3 | commit | 코멘트 답 + 수정 commit |
| 4 | push | 같은 PR에 추가 push |
| 5 | PR 생성 | 짝꿍 승인 → squash merge |
| 6 | (끝) | pull로 main 동기화 |

어제는 "내 변경을 팀에게 보내기"까지. 오늘은 "팀과 한 바퀴 돌기".

---

**5단계 협업 사이클 — 그림**

```
[어제 PR]
   ↓
1. 짝꿍이 코멘트 단다 ("출력 형태 가이드가 모호해요")
   ↓
2. 본인이 코멘트에 답 + 수정 commit
   ↓
3. 같은 브랜치에 push (PR 자동 업데이트)
   ↓
4. 짝꿍 승인 → squash merge
   ↓
5. 본인이 main에서 git pull
```

이 5단계가 한 번 돌아야 "내가 PR 흐름을 안다"고 말할 수 있다. 어제까지는 4단계 절반(올리기) 까지였다.

---

**왜 squash merge인가**

squash = "이 PR의 여러 commit을 1개로 합쳐서 main에 올린다"

장점: main의 history가 깔끔. 한 PR = 한 commit.
단점: PR 안의 세부 commit history가 사라짐 (PR 페이지에는 남아있음)

CSM 비개발자 협업에는 squash가 맞다. main에는 "PR 단위 변화"만 남는다.

---

**짝꿍 코멘트에 답하는 법**

1. PR 페이지의 코멘트를 읽는다
2. 동의하면 → 수정 후 "반영했습니다" 답
3. 동의 안 하면 → 본인 의도를 한 줄 설명, 짝꿍 의견 들어보기
4. 일부만 반영 → "X는 반영, Y는 다음 PR로" 라고 명시

코멘트 무시는 X. 짝꿍이 시간 들여 본 것이고, 답이 짧아도 "봤다"는 신호가 된다.

---

**충돌(conflict)이 나면**

어제 짝꿍이 같은 파일을 다르게 수정해서 main에 머지된 상태라면, 본인 PR을 머지할 때 충돌이 난다. 오늘은 이 경우 짝꿍과 같이 5분 안에 해결한다.

해결 방식:
1. GitHub 웹에서 "Resolve conflicts" 버튼
2. 충돌 부분에 `<<<<<<< HEAD` `=======` `>>>>>>> branch` 마커가 보임
3. 어떤 쪽을 살릴지 / 둘 다 살릴지 결정해서 마커 제거
4. "Mark as resolved" → "Commit merge"

오늘 충돌이 안 나면 그냥 머지. 충돌은 옵션 학습.

---

**오늘 추가로 새 PR 1개 (선택)**

시간 되면 오늘 본인 케이스 사이클 결과를 새 PR로 추가. `members/<이름>.md` 하단에 "Day 3 패턴 메모" 섹션 1줄 추가 → 새 commit/branch/push/PR.

어제 PR 머지 + 오늘 새 PR = 본인 git log 3개 commit 누적.

---

### 3. CSM 일상 적용

**왜 비개발자 CSM에게 PR 협업이 의미 있는가**

- 본인 CLAUDE.md / SKILL.md를 팀이 같이 다듬는 흐름 = "복리의 단위가 팀"
- 팀원 다른 사람이 수정해서 PR로 돌려주면 본인 머릿속에 없던 패턴이 들어옴
- main 한 곳에 모이면 신입 CSM이 즉시 clone으로 베이스라인 받음

오늘 머지까지 한 번 굴러봐야 이 흐름이 손에 잡힌다. "코드"가 아니라 "텍스트 파일 협업"이라는 감각.

---

### 4. 흔한 오해

**오해 1 — "내 PR 머지는 내가 한다"**

평소 협업에서는 짝꿍(또는 팀장)이 머지한다. 본인이 만든 변경을 본인이 검토하면 자기 맹점 통과. 어제 짝꿍이 리뷰어로 지정된 이유가 이것.

**오해 2 — "코멘트가 없으면 PR이 잘 된 것"**

아니다. 코멘트가 없는 PR은 짝꿍이 아직 안 본 PR이다. 머지 전에 "한번 봐줘"라고 명시적으로 요청.

**오해 3 — "머지하면 끝"**

머지 후 `git pull`을 안 하면 본인 로컬은 머지 전 상태로 멈춰 있다. 다음 작업할 때 충돌 위험. 머지 직후 pull 습관.

**오해 4 — "충돌이 나면 PR이 망가졌다"**

충돌은 정상이다. 두 사람이 같은 줄을 다르게 수정했을 때 발생. 짝꿍과 5분이면 해결. 망가진 게 아니라 "둘 중 어느 쪽 쓸지 결정해야 한다"는 신호.

---

## EXECUTE

**지금 직접 실행해보세요**

### 1단계 — 어제 PR 코멘트 확인 (3분)

GitHub에서 어제 본인 PR을 연다.

```
GitHub → 본인 repo → Pull requests → 어제 PR 클릭
```

짝꿍이 단 코멘트를 읽는다. 코멘트가 없으면 짝꿍에게 "어제 PR 한번 봐줘" 메시지.

---

### 2단계 — 코멘트에 답 + 수정 commit (5분)

각 코멘트에 짧게 답한다 (1-2줄).

수정이 필요하면 로컬에서 파일 수정.

```bash
# 어제 작업한 그 폴더에서
git status
git add <수정한 파일>
git commit -m "fix: 짝꿍 리뷰 반영 — 출력 형태 가이드 명시"
```

commit 메시지에 **"무엇을 반영했는지"** 한 줄.

---

### 3단계 — 같은 PR에 push (1분)

```bash
git push
```

PR 페이지를 새로고침하면 commit이 추가돼 있다. 같은 PR이 자동 업데이트됨 (새 PR 만들 필요 X).

짝꿍에게 "반영 완료, 다시 봐줘" 메시지.

---

### 4단계 — 짝꿍 승인 → squash merge (3분)

짝꿍이 "Approve" 누르면 GitHub PR 페이지에 초록색 머지 버튼이 활성화됨.

```
[Squash and merge] 버튼 → Confirm squash and merge
```

머지 후 자동으로 브랜치 삭제 권유 → "Delete branch" 클릭 (정리 차원).

⚠️ 충돌이 나면 GitHub 웹 "Resolve conflicts"로 5분 안에 해결. 막히면 짝꿍과 같이.

---

### 5단계 — pull로 main 동기화 (2분)

본인 로컬 터미널에서:

```bash
git checkout main      # main 브랜치로
git pull               # GitHub의 최신 main을 가져옴
git log --oneline -5   # 본인 commit이 main에 들어왔는지 확인
```

본인 commit이 main에 보이면 한 사이클 완료.

---

### 6단계 — 새 PR 1개 (선택, 6분)

오늘 본인 케이스 사이클 결과를 추가.

```bash
git checkout -b day3-cycle-pattern    # 새 브랜치
# members/<이름>.md 하단에 "Day 3 패턴 메모" 1줄 추가
git add members/<이름>.md
git commit -m "feat: Day 3 사이클 패턴 메모 추가"
git push -u origin day3-cycle-pattern
# GitHub 웹에서 PR 생성, 짝꿍 리뷰어 지정
```

이건 시간 되면. 머지는 내일도 가능.

---

**완료 기준**

- [ ] 어제 PR 코멘트 읽음
- [ ] 짝꿍 코멘트에 답 + 수정 commit
- [ ] 같은 PR에 push (PR 자동 업데이트 확인)
- [ ] 짝꿍 승인 → squash merge 완료
- [ ] git pull로 main 동기화 (commit 보임 확인)
- [ ] (선택) 오늘 사이클 패턴 새 PR

---

**관찰 포인트**

머지 전후 본인 로컬 git log를 비교한다. 머지 전에는 본인 commit이 본인 브랜치에만 있고, pull 후에는 main에도 들어와 있다. 이 흐름이 "내 변경이 팀에 합쳐졌다"는 시각적 증거.

---

## QUIZ

**Q1. 어제 PR과 오늘 PR 흐름의 가장 큰 차이는?**

```json
AskUserQuestion({
  "questions": [{
    "question": "어제(Day 2)는 PR을 어디까지 했고, 오늘(Day 3)은 무엇을 더 하는가?",
    "header": "Quiz Day3-B3-1",
    "options": [
      {"label": "어제는 commit, 오늘은 push", "description": "단계 차이 오해"},
      {"label": "어제는 PR 올리기까지, 오늘은 코멘트→수정→머지→pull로 한 바퀴", "description": "협업 한 사이클"},
      {"label": "어제는 본인 repo, 오늘은 팀 repo", "description": "repo 위치 오해"},
      {"label": "어제는 텍스트, 오늘은 코드", "description": "내용 종류 오해"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번

해설: 어제는 PR 올리기(commit + push + PR 생성)까지였다. 오늘은 그 PR에 짝꿍 코멘트 받기 → 답 + 수정 commit → 같은 PR에 push → 머지 → pull로 main 동기화까지 한 바퀴를 돈다. 5단계 다 굴러봐야 "내가 PR을 안다"가 된다.

---

**Q2. 짝꿍이 머지를 누른 직후 본인이 해야 하는 것은?**

```json
AskUserQuestion({
  "questions": [{
    "question": "PR이 main에 머지된 직후 본인이 잊지 말아야 할 동작은?",
    "header": "Quiz Day3-B3-2",
    "options": [
      {"label": "짝꿍에게 감사 메시지를 Slack으로 보낸다", "description": "예의 (필수 X)"},
      {"label": "본인 로컬에서 git pull로 main을 동기화한다", "description": "로컬 동기화"},
      {"label": "어제 만든 브랜치를 git branch -D로 삭제한다", "description": "브랜치 정리"},
      {"label": "특별히 할 일이 없다 — 머지로 끝", "description": "끝났다 오해"}
    ],
    "multiSelect": false
  }]
})
```

정답: 2번

해설: 머지 후 `git pull`을 안 하면 본인 로컬 main은 머지 전 상태에 멈춰 있다. 다음 작업할 때 충돌 위험이 커진다. 머지 직후 pull은 협업 사이클의 마지막 단계. 1번·3번은 좋지만 필수는 아니다.
