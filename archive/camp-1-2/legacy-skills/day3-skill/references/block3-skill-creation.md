# Block 3: 스킬 제작 2 — SKILL.md 생성 + 테스트

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/skills
> ```

## EXPLAIN

이제 Clarify로 구체화한 내용을 바탕으로 실제 SKILL.md를 만듭니다.

### SKILL.md 필수 구성

```markdown
---
name: skill-name          # 영문 소문자 + 하이픈
description: 스킬 설명     # 한 문장 + 호출 트리거
---

# 스킬 제목

## 목적
한 문장으로 무엇을 해결하는지

## 입력
- 입력 1: 설명
- 입력 2: 설명

## 실행 단계
1. 첫 번째 단계 (구체적으로)
2. 두 번째 단계
3. 세 번째 단계

## 출력
- 파일: 경로/파일명
- 형식: 설명
```

### 스킬 폴더 구조

```
.claude/skills/my-skill/
├── SKILL.md          # 필수: 스킬의 본체
├── scripts/          # 선택: 실행할 코드
├── references/       # 선택: 참고 문서
└── assets/           # 선택: 템플릿, 리소스
```

**SKILL.md 하나만 있으면 스킬이 됩니다!** 나머지는 필요할 때 추가.

### 스킬 호출 방법

| 방식 | 예시 |
|------|------|
| 직접 호출 | `/newsletter-curator` |
| 자동 매칭 | "뉴스레터 정리해줘" → description 매칭 |
| 명시적 호출 | "newsletter-curator 스킬 실행해줘" |

## EXECUTE

**Step 1: SKILL.md 생성**

Claude에게 요청:
```
지금까지 정리한 내용으로 [스킬명] 스킬을 만들어줘.
.claude/skills/[스킬명]/SKILL.md 에 저장해줘.
```

**Step 2: 생성된 SKILL.md 확인**

확인할 체크리스트:
- [ ] frontmatter에 `name`과 `description`이 있는가?
- [ ] 목적이 한 문장으로 명확한가?
- [ ] 입력과 출력이 분명한가?
- [ ] 실행 단계에 "적절히", "알아서" 같은 모호한 표현이 없는가?

**Step 3: 테스트 실행**

```
방금 만든 [스킬명] 스킬을 실행해줘
```

**Step 3.5: 재현성 테스트**

/clear 후 같은 스킬을 다시 실행해보세요. 결과가 같나요? 다르다면 어떤 지시가 모호했는지 찾아서 수정해보세요.

> 💡 재현성이 낮다면 SKILL.md의 실행 단계에 "적절히", "알아서" 같은 모호한 표현이 있을 수 있습니다.
> 구체적인 기준과 형식을 명시하면 재현성이 올라갑니다.

**Step 4: 결과 확인 + 수정**

결과를 보고 개선할 점이 있으면:
```
이 스킬의 [구체적 부분]을 [원하는 방식]으로 수정해줘
```

> 완벽하지 않아도 괜찮습니다! v1을 만든 것 자체가 성과입니다.

> 💡 Build → Use → Notice → Fix 사이클을 돌았습니다!

## QUIZ

**Q1. SKILL.md의 frontmatter에 반드시 포함해야 하는 것은?**

```json
{
  "questions": [{
    "question": "SKILL.md의 frontmatter에 반드시 포함해야 하는 것은?",
    "header": "Q1",
    "options": [
      {"label": "작성 날짜와 저자", "description": "메타데이터?"},
      {"label": "name과 description", "description": "스킬 식별자와 설명"},
      {"label": "버전 번호", "description": "버전 관리?"},
      {"label": "라이선스 정보", "description": "저작권?"}
    ],
    "multiSelect": false
  }]
}
```
정답: 2번 (name과 description)
해설: frontmatter의 name(스킬 식별자)과 description(설명+호출 트리거)이 필수입니다.

**Q2. 스킬을 호출하는 방법이 아닌 것은?**

```json
{
  "questions": [{
    "question": "스킬을 호출하는 방법이 아닌 것은?",
    "header": "Q2",
    "options": [
      {"label": "/스킬이름 으로 직접 호출", "description": "슬래시 명령어"},
      {"label": "자연어로 요청하여 description 매칭", "description": "자동 매칭"},
      {"label": "CLAUDE.md에 적어서 자동 실행", "description": "CLAUDE.md 기반"},
      {"label": "스킬이름 스킬 실행해줘 (명시적 호출)", "description": "직접 언급"}
    ],
    "multiSelect": false
  }]
}
```
정답: 3번 (CLAUDE.md에 적어서 자동 실행)
해설: CLAUDE.md에 적는다고 스킬이 자동 실행되지는 않습니다. 스킬은 호출해야 실행됩니다.

**Q3. 스킬 제작 후 가장 중요한 다음 단계는?**

```json
{
  "questions": [{
    "question": "스킬 제작 후 가장 중요한 다음 단계는?",
    "header": "Q3",
    "options": [
      {"label": "문서화하기", "description": "문서 작성"},
      {"label": "팀에 공유하기", "description": "공유"},
      {"label": "실제로 실행하고 결과를 확인하기", "description": "테스트와 검증"},
      {"label": "코드를 최적화하기", "description": "최적화"}
    ],
    "multiSelect": false
  }]
}
```
정답: 3번 (실행 + 결과 확인)
해설: 만들고 나서 실제로 실행해보고, 결과를 확인하고, 개선하는 과정이 가장 중요합니다.
