# Block B3: 팀 repo + 업로드 실습 + PR 워크플로우

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 GitHub PR 가이드: https://docs.github.com/ko/pull-requests
> ```

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 GitHub PR 가이드: https://docs.github.com/ko/pull-requests
> ```

## EXPLAIN

### 왜 팀 공유인가

```
한 사람 개선 = 한 명만 혜택
팀 공유 = 팀 전체 혜택 (복리 × N명)
```

### 팀 repo 원칙 — Play Store 모델

```
× 하지 않는다                    ✓ 하는 것
  운영진이 모든 스킬 심사           README 6축 태그 필수
  양식이 너무 엄격                 한 문장 설명 필수
  "완벽할 때 올리자" → 안 올라감    PR로 올리기 (리뷰는 가벼움)
  결과: 팀 repo가 죽는다           많이 쓰이는 스킬이 자연 선택
```

이상적인 repo = **쓸 스킬이 많은 repo**. 완성도보다 업로드 빈도가 장기적 품질을 올린다.

### 팀 repo 구조

```
csm-claude-skills/
  skills/
    recap-mail/
      SKILL.md
      README.md   ← 6축 태그 + 한 문장 설명
    inquiry-reply/
      SKILL.md
    ...
  README.md       ← 팀 전체 안내
```

### README 6축 태그

```markdown
## recap-mail

| 축 | 상태 |
|---|---|
| 구조 | CLAUDE.md 톤·금지어 읽음 |
| 맥락 | Notion MCP 사용 |
| 계획 | - |
| 실행 | /recap-mail [고객명] [기간] |
| 검증 | - |
| 개선 | v2 — 다음 분기 일정 금지 추가 |
```

### 업로드 실습 5단계

```
1. git clone [팀 repo URL]
2. cd csm-claude-skills && git checkout -b add-[스킬이름]
3. 내 스킬 폴더를 skills/에 복사. README 6축 태그 확인.
4. git commit -m "feat: [스킬 이름] 추가"
5. git push origin add-[스킬이름]
→ GitHub 웹에서 PR 생성
```

명령어는 Claude가 실행. 참가자는 의도만 말하면 된다.

### PR 워크플로우

```
main에 직접 push 금지 → 브랜치 → PR → 리뷰 → Merge

이유: main에 잘못된 스킬이 올라가면 팀 전체에 영향.
     PR이 안전장치.

PR 작성:
  타이틀 1줄: "feat: recap-mail 스킬 추가"
  본문: 언제 쓰나 + 입력/출력 1줄씩
  리뷰어: 짝꿍 또는 팀장
```

### 리뷰어 체크리스트 (5개만)

1. /skill 한 번 호출해봄?
2. 출력이 기대와 다른 케이스 있나?
3. MCP 없이도 동작하나? (MCP 없는 팀원 고려)
4. README 6축 태그 채워짐?
5. 스킬 이름이 검색 가능한 이름인가?

## EXECUTE

위 5단계 업로드 실습을 진행하세요.

Claude Code에서:
```
csm-claude-skills 레포를 clone해줘.
그리고 내 스킬 폴더를 skills/ 안에 복사해줘.
README 6축 태그도 간단히 채워줘.
```

막히면 짝꿍과 화면 공유 · 운영진 호출.

## QUIZ

이 블록은 QUIZ 없음. PR 생성 완료 후 B4로 이동.
