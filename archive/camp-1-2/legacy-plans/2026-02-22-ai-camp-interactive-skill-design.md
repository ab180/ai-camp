# AI Native Camp 인터랙티브 교육 스킬 구현 계획

> **For Claude:** REQUIRED SUB-SKILL: Use superpowers:executing-plans to implement this plan task-by-task.

**Goal:** 4일치 AI Native Camp 강의를 터미널에서 인터랙티브하게 학습하는 Claude Code 스킬 세트를 만든다.

**Architecture:** 각 Day를 독립 스킬(/day1~/day4)로 구현. SKILL.md에 EXPLAIN→EXECUTE→QUIZ 흐름을 Block 단위로 담고, 상세 개념은 references/concepts.md로 분리. 사용자가 "다음"할 때까지 대기하는 셀프러너 방식.

**Tech Stack:** Claude Code Skills (SKILL.md frontmatter), AskUserQuestion (퀴즈), references/ (상세 개념)

---

## 사전 작업

### Task 0: 디렉토리 구조 생성

**Files:**
- Create: `~/Downloads/camp/.claude/skills/day1-onboarding/SKILL.md` (빈 파일)
- Create: `~/Downloads/camp/.claude/skills/day1-onboarding/references/concepts.md` (빈 파일)
- Create: `~/Downloads/camp/.claude/skills/day2-context/SKILL.md`
- Create: `~/Downloads/camp/.claude/skills/day2-context/references/concepts.md`
- Create: `~/Downloads/camp/.claude/skills/day3-skill/SKILL.md`
- Create: `~/Downloads/camp/.claude/skills/day3-skill/references/concepts.md`
- Create: `~/Downloads/camp/.claude/skills/day4-compound/SKILL.md`
- Create: `~/Downloads/camp/.claude/skills/day4-compound/references/concepts.md`

**Step 1:** 디렉토리 생성
```bash
mkdir -p ~/Downloads/camp/.claude/skills/{day1-onboarding,day2-context,day3-skill,day4-compound}/references
```

**Step 2:** 빈 파일 터치
```bash
touch ~/Downloads/camp/.claude/skills/{day1-onboarding,day2-context,day3-skill,day4-compound}/SKILL.md
touch ~/Downloads/camp/.claude/skills/{day1-onboarding,day2-context,day3-skill,day4-compound}/references/concepts.md
```

---

## Day 1 구현

### Task 1: Day 1 references/concepts.md 작성

**Files:**
- Create: `~/Downloads/camp/.claude/skills/day1-onboarding/references/concepts.md`
- Reference: `~/Downloads/camp/lecture/day1_lecture_guide_complete.md`

원본 강의 가이드의 "3. 핵심 개념 상세 정리" 섹션(3.1~3.9)을 기반으로 작성.
포함할 내용:
- 지식노동자 개념 + AI 시대 변화
- 도구의 진화 (추상화 계층 상승)
- Allocation Economy
- 새로운 핵심 역량 3가지
- 7개 핵심 기능 비유 + 원리
- CLI 명령어 5개 + git/GitHub 비유
- 비개발자 FAQ

### Task 2: Day 1 SKILL.md 작성

**Files:**
- Create: `~/Downloads/camp/.claude/skills/day1-onboarding/SKILL.md`
- Reference: `~/Downloads/camp/lecture/day1_lecture_guide_complete.md`

SKILL.md 구조:

```markdown
---
name: day1-onboarding
description: "AI Native Camp Day 1 — AI 시대의 변화와 Claude Code. '/day1', '온보딩' 요청 시 사용."
---

# Day 1: AI 시대의 변화와 Claude Code

## 진행 가이드 (Claude가 따를 지시)
[사용자 인터랙션 패턴, 진행 규칙]

## Block 0: Setup
### EXPLAIN
### EXECUTE
### (퀴즈 없음)

## Block 1: 핵심 개념
### EXPLAIN
### QUIZ (3문항)

## Block 2: Experience
### EXPLAIN
### EXECUTE

## Block 3: 7개 핵심 기능
### EXPLAIN
### EXECUTE
### QUIZ (3문항)

## Block 4: CLI + git 기초
### EXPLAIN
### EXECUTE
### QUIZ (3문항)

## 마무리
```

목표 줄수: 400-600줄.
Block별 EXPLAIN은 핵심 비유+개념만 압축 (상세는 "references/concepts.md 참조"로 안내).
EXECUTE는 구체적 명령어+기대 결과 명시.
QUIZ는 AskUserQuestion tool로 객관식 출제 지시.

---

## Day 2 구현

### Task 3: Day 2 references/concepts.md 작성

**Files:**
- Create: `~/Downloads/camp/.claude/skills/day2-context/references/concepts.md`
- Reference: `~/Downloads/camp/lecture/day2_lecture_guide.md`

포함할 내용:
- 도구별 설계 철학 완전 가이드 (Slack/Gmail/Notion/Drive/Linear/Calendar)
- MCP 완전 가이드 (정의, 작동원리, 연결 3가지, 관리)
- Context Sync 스킬 완전 가이드 (구조, 구축 단계, 활용 팁)
- Subagent 병렬 수집

### Task 4: Day 2 SKILL.md 작성

**Files:**
- Create: `~/Downloads/camp/.claude/skills/day2-context/SKILL.md`

구조: Block 0(맥락의 중요성) → Block 1(도구별 설계 철학) → Block 2(MCP 딥다이브) → Block 3(MCP 실습) → Block 4(Context Sync 구축) → Block 5(마무리)

---

## Day 3 구현

### Task 5: Day 3 references/concepts.md 작성

**Files:**
- Create: `~/Downloads/camp/.claude/skills/day3-skill/references/concepts.md`
- Reference: `~/Downloads/camp/lecture/day3_lecture_guide.md`

포함할 내용:
- Clarify 프로세스 완전 가이드
- 좋은 스킬의 설계 원칙
- SKILL.md 작성 가이드
- 스킬 체이닝 개념
- 플랜 모드 사용법
- 의사결정 로그 파일 가이드

### Task 6: Day 3 SKILL.md 작성

**Files:**
- Create: `~/Downloads/camp/.claude/skills/day3-skill/SKILL.md`

구조: Block 0(스킬 설계 원칙) → Block 1(Clarify) → Block 2(스킬 제작 1: 번역+Clarify) → Block 3(스킬 제작 2: 생성+테스트) → Block 4(스킬 체이닝)

---

## Day 4 구현

### Task 7: Day 4 references/concepts.md 작성

**Files:**
- Create: `~/Downloads/camp/.claude/skills/day4-compound/references/concepts.md`
- Reference: `~/Downloads/camp/lecture/day4_lecture_guide.md`

포함할 내용:
- Context Engineering 완전 가이드
- Compound Engineering 완전 가이드
- GitHub 완전 가이드 (비개발자용)
- Vercel + Supabase 완전 가이드

### Task 8: Day 4 SKILL.md 작성

**Files:**
- Create: `~/Downloads/camp/.claude/skills/day4-compound/SKILL.md`

구조: Block 0(Context Engineering) → Block 1(Compound Engineering) → Block 2(GitHub 기초) → Block 3(서비스화) → Block 4(Compound 실습) → Block 5(마무리)

---

## 검증

### Task 9: 전체 구조 검증

**Step 1:** 파일 존재 확인
```bash
find ~/Downloads/camp/.claude/skills/ -type f | sort
```

Expected:
```
.claude/skills/day1-onboarding/SKILL.md
.claude/skills/day1-onboarding/references/concepts.md
.claude/skills/day2-context/SKILL.md
.claude/skills/day2-context/references/concepts.md
.claude/skills/day3-skill/SKILL.md
.claude/skills/day3-skill/references/concepts.md
.claude/skills/day4-compound/SKILL.md
.claude/skills/day4-compound/references/concepts.md
```

**Step 2:** 각 SKILL.md frontmatter 검증
```bash
head -5 ~/Downloads/camp/.claude/skills/*/SKILL.md
```

Expected: 각 파일에 `---` + `name:` + `description:` 존재

**Step 3:** 줄수 확인
```bash
wc -l ~/Downloads/camp/.claude/skills/*/SKILL.md
```

Expected: 각 파일 400-600줄 범위

---

## 실행 순서

Task 0 → (Task 1, 3, 5, 7 병렬) → (Task 2, 4, 6, 8 병렬) → Task 9

references 4개는 독립 → 병렬 가능.
SKILL.md 4개도 독립 → 병렬 가능.
단, 각 Day의 SKILL.md는 해당 Day의 references 완료 후 작성 (참조 필요).
