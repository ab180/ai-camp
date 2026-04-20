---
name: day4-compound
description: AI Native Camp Day 4 시스템화. Context Engineering + Compound Engineering으로 만든 걸 복리로 키운다. "4일차", "Day 4", "Compound", "시스템화", "복리" 요청에 사용.
---

# Day 4: 시스템화 — 만든 걸 복리로 키우는 법

이 스킬이 호출되면 아래 **STOP PROTOCOL**을 반드시 따른다.

---

## 용어 정리

이 스킬에서 사용하는 핵심 용어:

| 용어 | 설명 |
|------|------|
| **Context Engineering** | 프롬프트가 아니라 "맥락을 설계"하는 것. Day 1-3에서 배운 모든 것의 정체 |
| **Compound Engineering** | 만든 것을 쓰면서 고치면 복리로 성장하는 것. "1.01의 365승 = 37.8" |
| **풀 사이클** | Build → Use → Notice → Debug → Fix → Document 6단계. 한 바퀴 돌면 개선 |
| **GitHub** | 코드와 파일의 변경 이력을 기록하는 저장소. "구글 독스의 버전 기록 + 협업" |
| **Repository** | GitHub에서 하나의 프로젝트를 담는 폴더. "서류 보관함" |
| **Commit** | 변경 내용을 기록하는 스냅샷. "Ctrl+S의 끝판왕 — 메시지 달린 저장" |
| **Branch** | 메인 코드를 건드리지 않고 실험하는 공간. "초안 작업용 복사본" |
| **Pull Request (PR)** | 내 변경을 메인에 합쳐달라는 요청. "검토 후 반영해주세요" |
| **서비스화** | 스킬(로컬)을 URL로 접근 가능한 서비스로 확장하는 것 |

---

## STOP PROTOCOL — 절대 위반 금지

> 이 프로토콜은 이 스킬의 최우선 규칙이다.
> 아래 규칙을 위반하면 수업이 망가진다.

### 각 블록은 반드시 2턴에 걸쳐 진행한다

```
┌─ Phase A (첫 번째 턴) ──────────────────────────────┐
│ 1. references/에서 해당 블록 파일의 EXPLAIN 섹션을 읽는다    │
│ 2. 기능을 설명한다                                        │
│ 3. references/에서 해당 블록 파일의 EXECUTE 섹션을 읽는다    │
│ 4. "지금 직접 실행해보세요"라고 안내한다                     │
│ 5. ⛔ 여기서 반드시 STOP. 턴을 종료한다.                    │
│                                                          │
│ ❌ 절대 하지 않는 것: 퀴즈 출제, QUIZ 섹션 읽기             │
│ ❌ 절대 하지 않는 것: AskUserQuestion 호출                  │
│ ❌ 절대 하지 않는 것: "실행해봤나요?" 질문                   │
└──────────────────────────────────────────────────────────┘

  ⬇️ 사용자가 돌아와서 "했어", "완료", "다음" 등을 입력한다

┌─ Phase B (두 번째 턴) ──────────────────────────────┐
│ 1. references/에서 해당 블록 파일의 QUIZ 섹션을 읽는다       │
│ 2. AskUserQuestion으로 퀴즈를 출제한다                     │
│ 3. 정답/오답 피드백을 준다                                 │
│ 4. 다음 블록으로 이동할지 AskUserQuestion으로 묻는다         │
│ 5. ⛔ 다음 블록을 시작하면 다시 Phase A부터.                │
└──────────────────────────────────────────────────────────┘
```

### 핵심 금지 사항 (절대 위반 금지)

1. **Phase A에서 AskUserQuestion을 호출하지 않는다** — 설명 + 실행 안내 후 바로 Stop
2. **Phase A에서 퀴즈를 내지 않는다** — QUIZ 섹션은 Phase B에서만 읽는다
3. **Phase A에서 "실행해봤나요?"를 묻지 않는다** — 사용자가 먼저 말할 때까지 기다린다
4. **한 턴에 EXPLAIN + QUIZ를 동시에 하지 않는다** — 반드시 2턴으로 나눈다

### 공식 문서 URL 출력 (절대 누락 금지)

모든 블록의 Phase A 시작 시, 해당 reference 파일 상단의 `> 공식 문서:` URL을 **반드시 그대로 출력**한다.

```
📖 공식 문서: [URL]
```

- reference 파일에 URL이 여러 개 있으면 전부 출력한다
- URL을 요약하거나 생략하지 않는다

### Phase A 종료 시 필수 문구

Phase A의 마지막에는 반드시 아래 형태의 문구를 출력하고 Stop한다:

```
---
👆 위 내용을 직접 실행해보세요.
실행이 끝나면 "완료" 또는 "다음"이라고 입력해주세요.
```

이 문구 이후에 어떤 도구 호출(AskUserQuestion 포함)이나 추가 텍스트도 출력하지 않는다.

---

## 소요 시간 가이드

| Block | 주제 | 예상 시간 |
|-------|------|-----------|
| 0 | Context Engineering | ~10분 |
| 1 | Compound Engineering | ~10분 |
| 2 | GitHub 기초 | ~15분 |
| 3 | 서비스화 | ~15분 |
| 4 | Compound 사이클 실습 | ~25분 |
| **합계** | | **~75분** |

> Block 4(실습)가 가장 시간이 많이 걸리는 핵심 블록입니다. 실제로 CLAUDE.md를 개선하고, 스킬을 수정하고, 1주 목표를 설정합니다.

---

## 핵심 전략: 이론 정리 → 도구 이해 → 실습으로 마무리

아래 방식으로 진행한다:

1. Block 0에서 Day 1-3의 정체 = Context Engineering임을 깨닫는다
2. Block 1에서 Compound Engineering의 복리 효과를 이해한다
3. Block 2에서 GitHub 기초 (Repository, Commit, Branch, PR)를 배운다
4. Block 3에서 스킬을 서비스로 확장하는 방법 (GitHub + Vercel + Supabase)을 이해한다
5. Block 4에서 풀 사이클을 직접 돌면서 실습하고, 1주 목표를 설정한다

> Day 4는 "새로운 것을 배우는 날"이 아니라, "배운 것을 계속 키우는 법을 배우는 날"이다.

---

## 블록 특수 규칙

- **Block 0 (Context Engineering)**: Phase A에서 Day 1-3의 패턴을 Context Engineering으로 묶어 설명 + 3가지 교훈 정리 → Stop. Phase B에서 퀴즈.
- **Block 1 (Compound Engineering)**: Phase A에서 풀 사이클 6단계 설명 + 복리 효과 비유 → Stop. Phase B에서 퀴즈.
- **Block 2 (GitHub 기초)**: QUIZ가 없다. Phase A에서 Repository/Commit/Branch/PR을 비유로 설명 + git 명령어 안내 → Stop. 완료 확인 후 다음 블록.
- **Block 3 (서비스화)**: Phase A에서 GitHub + Vercel + Supabase 3인프라 설명 → Stop. Phase B에서 퀴즈.
- **Block 4 (실습)**: QUIZ가 없다. Phase A에서 CLAUDE.md 규칙 추가 + 스킬 개선 + 1주 목표 설정 안내 → Stop. 완료 확인 후 캠프 마무리.

---

## References 파일 맵

| 블록 | 파일 | 주제 |
|------|------|------|
| Block 0 | `references/block0-context-engineering.md` | Context Engineering = Day 1-3의 정체 |
| Block 1 | `references/block1-compound-engineering.md` | Compound Engineering + 풀 사이클 6단계 |
| Block 2 | `references/block2-github-basics.md` | GitHub 기초 (Repository, Commit, Branch, PR) |
| Block 3 | `references/block3-service.md` | 스킬 → 서비스 (GitHub + Vercel + Supabase) |
| Block 4 | `references/block4-compound-practice.md` | Compound 사이클 실습 + 1주 목표 |

> 파일 경로는 이 SKILL.md 기준 상대경로다.
> 각 reference 파일은 `## EXPLAIN`, `## EXECUTE`, `## QUIZ` 섹션으로 구성된다.

---

## 진행 규칙

- 한 번에 한 블록씩 진행한다
- "다음", "skip", 블록 번호/이름으로 이동한다
- 각 블록 시작 시 진행 상태를 표시한다: `📍 Day 4 진행: [Block N/4] — 블록 제목`
- 모든 응답은 **한국어**로 한다
- Claude Code 관련 질문이 오면 claude-code-guide 에이전트(내장 도구)로 답변한다. 답변 후 사용자가 직접 따라할 수 있게 단계별로 안내하고, 질문할 때는 AskUserQuestion을 사용한다. 내장 에이전트 답변이 부정확하다고 판단되면, 공식 문서를 `curl`로 파일에 저장한 뒤 Read 툴로 꼼꼼히 읽고 정확한 정보로 다시 답한다 (WebFetch는 요약/손실 위험이 있으므로 사용하지 않는다)

---

## 시작

스킬 시작 시 아래 테이블을 보여주고 AskUserQuestion으로 어디서 시작할지 물어본다.

| Block | 주제 | 내용 |
|-------|------|------|
| 0 | Context Engineering | Day 1-3의 정체 = 맥락 설계 |
| 1 | Compound Engineering | 풀 사이클로 복리 성장 |
| 2 | GitHub 기초 | Repository, Commit, Branch, PR |
| 3 | 서비스화 | 스킬을 서비스로 확장 |
| 4 | 실습 | Compound 사이클 직접 돌기 + 1주 목표 |

```json
AskUserQuestion({
  "questions": [{
    "question": "Day 4: 시스템화 — 만든 걸 복리로 키우는 법\n\n어디서부터 시작할까요?",
    "header": "시작 블록",
    "options": [
      {"label": "처음부터 (Block 0)", "description": "Context Engineering부터 순서대로 (추천)"},
      {"label": "Compound Engineering (Block 1)", "description": "복리 성장 개념부터"},
      {"label": "GitHub 기초 (Block 2)", "description": "버전 관리부터"},
      {"label": "서비스화 (Block 3)", "description": "스킬을 서비스로 확장"},
      {"label": "실습 바로 시작 (Block 4)", "description": "이론 건너뛰고 실습부터"}
    ],
    "multiSelect": false
  }]
})
```

> 시작 블록 선택 후 → 해당 블록의 Phase A부터 진행한다.

---

## 마무리

모든 블록 완료 후 아래를 보여준다:

### 오늘 배운 것 정리

| 개념 | 핵심 |
|------|------|
| Context Engineering | 프롬프트가 아니라 **맥락을 설계**하는 것 |
| Compound Engineering | 쓰면서 고치면 **복리로 성장** |
| 풀 사이클 | Build → Use → Notice → Debug → Fix → Document |
| GitHub 기초 | Repository, Commit, Branch, PR — **기록의 인프라** |
| 서비스화 | GitHub + Vercel + Supabase로 스킬을 서비스로 확장 |

### 4일간의 여정 요약

```
Day 1: CLAUDE.md     = Context 설계     ✅
Day 2: MCP 연결      = Context 확장     ✅
Day 3: 스킬 제작     = Context 활용     ✅
Day 4: 복리로 키우기 = Context 개선     ✅ (오늘)
```

### 산출물 확인
- [ ] 개선된 CLAUDE.md (새 규칙 추가)
- [ ] 1주 목표 설정 완료

### 1주일 동안 할 일
1. **만든 것 실제로 써보기** — CLAUDE.md, 스킬을 실제 업무에 적용
2. **불편한 점 발견하면 고치기** — Compound Engineering 사이클 반복
3. **최종 발표 준비** — 동작하는 영상 또는 링크 준비

### 핵심 메시지

> "4일 동안 세 가지를 만들었습니다.
> CLAUDE.md, MCP 연결, 스킬.
>
> 오늘 배운 건 이것들을 **내 마음에 들게** 만드는 법입니다.
>
> 쓰고, 고치고, 쌓으세요.
> **그게 복리입니다.**"

AI Native Camp 4일 과정을 모두 완료했습니다!
1주 후 최종 발표에서 여러분의 결과물을 기대합니다.
