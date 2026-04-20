# AI Native Camp — Interactive Learning Skills

> Claude Code에서 `/day1` ~ `/day4`를 입력하면 시작되는 4일 과정의 인터랙티브 AI 교육 스킬셋

## 한눈에 보기

| Day | 스킬 | 테마 | 핵심 학습 |
|-----|------|------|----------|
| Day 1 | `/day1` | AI 시대의 변화 | CLAUDE.md, 7대 기능, CLI 기초 |
| Day 2 | `/day2` | 맥락 연결하기 | MCP, Context Sync, 도구 설계 철학 |
| Day 3 | `/day3` | 스킬 설계와 제작 | Clarify, SKILL.md, 스킬 체이닝, 에이전트 활용 |
| Day 4 | `/day4` | 시스템화 | Compound Engineering, GitHub, 서비스화 |

---

## 무엇인가요?

AI Native Camp는 **비개발자**를 위한 Claude Code 교육 프로그램입니다. 이 저장소는 그 강의 내용을 **터미널에서 직접 인터랙티브하게 학습**할 수 있도록 만든 Claude Code 스킬 세트입니다.

각 Day는 독립적인 스킬로 구현되어 있으며, **EXPLAIN → EXECUTE → QUIZ** 패턴으로 구성되어 있습니다:

- **EXPLAIN**: 핵심 개념을 비유와 함께 압축 전달
- **EXECUTE**: 직접 따라할 수 있는 실습 명령어 제공
- **QUIZ**: 객관식 퀴즈로 이해도 확인 (AskUserQuestion tool 활용)

---

## 설치 방법

### 방법 1: 전체 클론 (추천)

```bash
# 1. 저장소 클론
git clone https://github.com/song-yechan/ai-native-camp-skills.git

# 2. 디렉토리 이동
cd ai-native-camp-skills

# 3. Claude Code 실행
claude

# 4. Day 1 시작!
/day1
```

### 방법 2: 기존 프로젝트에 스킬만 복사

```bash
# 1. 저장소 클론 (임시)
git clone https://github.com/song-yechan/ai-native-camp-skills.git /tmp/camp-skills

# 2. 스킬 폴더만 복사
cp -r /tmp/camp-skills/.claude/skills/day* ~/.claude/skills/
# 또는 프로젝트 내 .claude/skills/ 에 복사
cp -r /tmp/camp-skills/.claude/skills/day* your-project/.claude/skills/

# 3. 임시 클론 삭제
rm -rf /tmp/camp-skills
```

---

## 디렉토리 구조

```
ai-native-camp-skills/
├── README.md
├── .gitignore
├── .claude/
│   └── skills/
│       ├── day1-onboarding/
│       │   ├── SKILL.md                        # 스킬 본체 (STOP PROTOCOL + 진행 흐름)
│       │   └── references/
│       │       ├── block0-setup.md             # 환경 설정
│       │       ├── block1-concepts.md          # AI 시대 핵심 개념
│       │       ├── block2-experience.md        # Claude Code 첫 체험
│       │       ├── block3-1-claude-md.md       # CLAUDE.md — 영구 기억
│       │       ├── block3-2-skill.md           # Skill — 반복 작업 레시피
│       │       ├── block3-3-mcp.md             # MCP — 외부 도구 연결
│       │       ├── block3-4-subagent.md        # Subagent — 일 나눠주기
│       │       ├── block3-5-agent-teams.md     # Agent Teams — 팀 분업
│       │       ├── block3-6-hook.md            # Hook — 자동화 트리거
│       │       ├── block3-7-plugin.md          # Plugin — 스킬 패키지
│       │       └── block4-cli-git.md           # CLI + git 기초
│       ├── day2-context/
│       │   ├── SKILL.md
│       │   └── references/
│       │       ├── block0-context-importance.md
│       │       ├── block1-tool-philosophy.md
│       │       ├── block2-mcp-deepdive.md
│       │       ├── block3-mcp-practice.md
│       │       └── block4-context-sync.md
│       ├── day3-skill/
│       │   ├── SKILL.md
│       │   └── references/
│       │       ├── block0-design-principles.md
│       │       ├── block1-clarify.md
│       │       ├── block2-skill-translation.md
│       │       ├── block3-skill-creation.md
│       │       ├── block4-skill-chaining.md
│       │       └── block5-agent.md
│       └── day4-compound/
│           ├── SKILL.md
│           └── references/
│               ├── block0-context-engineering.md
│               ├── block1-compound-engineering.md
│               ├── block2-github-basics.md
│               ├── block3-service.md
│               └── block4-compound-practice.md
└── lecture/                                    # 원본 강의 가이드 (참고용)
    ├── day1_lecture_guide_complete.md
    ├── day2_lecture_guide.md
    ├── day3_lecture_guide.md
    └── day4_lecture_guide.md
```

### 파일 역할 설명

| 파일 | 역할 |
|------|------|
| `SKILL.md` | **스킬의 본체**. STOP PROTOCOL(2-Phase 진행 규칙), reference 파일 맵, 시작 블록 선택, 마무리만 포함하는 lean 라우터 파일입니다. |
| `references/blockN-*.md` | **블록별 상세 콘텐츠**. 각 블록의 EXPLAIN, EXECUTE, QUIZ 내용이 담겨 있습니다. Claude가 해당 블록 진행 시 Read하여 사용합니다. |
| `lecture/*.md` | **원본 강의 가이드**. 오프라인 강의에서 사용된 발표자 가이드입니다. 스킬의 원천 자료이며, 추가 맥락이 필요할 때 참고합니다. |

---

## 학습 흐름

### 전체 커리큘럼

```
Day 1: CLAUDE.md = Context 설계       ← "나의 맥락을 구조화"
Day 2: MCP 연결 = Context 확장        ← "외부 도구의 맥락을 연결"
Day 3: 스킬 제작 = Context 활용       ← "맥락 기반 워크플로우"
Day 4: 복리 성장 = Context 개선       ← "쓰면서 고치는 시스템"
```

### 각 Day 상세 구성

#### Day 1: AI 시대의 변화와 Claude Code (`/day1`)

| Block | 주제 | 학습 내용 |
|-------|------|----------|
| Block 0 | Setup | Claude Code 환경 확인 |
| Block 1 | 핵심 개념 | 지식노동자 변화, Allocation Economy, 새로운 역량 3가지 |
| Block 2 | Experience | Claude Code 첫 체험 (파일 생성/수정) |
| Block 3 | 7대 기능 | CLAUDE.md(3-1), Skill(3-2), MCP(3-3), Subagent(3-4), Agent Teams(3-5), Hook(3-6), Plugin(3-7) — 개별 파일 |
| Block 4 | CLI + git | 터미널 명령어 5개, git 기초, GitHub 개념 |

**산출물**: CLAUDE.md 초안

#### Day 2: 맥락 연결하기 (`/day2`)

| Block | 주제 | 학습 내용 |
|-------|------|----------|
| Block 0 | 맥락의 중요성 | 같은 AI + 다른 맥락 = 다른 결과 |
| Block 1 | 도구별 설계 철학 | Slack, Gmail, Notion, Drive, Linear, Calendar |
| Block 2 | MCP 딥다이브 | 작동 원리, 연결 방법 3가지, 확인/관리 |
| Block 3 | MCP 실습 | 직접 MCP 연결 + 활용 테스트 |
| Block 4 | Context Sync | 여러 도구 → 하나의 문서 자동 수집 스킬 구축 |

**산출물**: MCP 연결 1개+ , Context Sync 스킬 골격

#### Day 3: 스킬 설계와 제작 (`/day3`)

| Block | 주제 | 학습 내용 |
|-------|------|----------|
| Block 0 | 스킬 설계 원칙 | 좋은 스킬의 3조건 (목적/입출력/단계) |
| Block 1 | Clarify | 모호함→명확함 (Vague/Unknown/Meta) |
| Block 2 | 스킬 제작 1 | 문제를 스킬 언어로 번역 + Clarify |
| Block 3 | 스킬 제작 2 | SKILL.md 생성 + 테스트 |
| Block 4 | 스킬 체이닝 | 스킬A 출력 → 스킬B 입력 (공장 라인) |
| Block 5 | 에이전트 활용 | Subagent vs Agent Teams, 병렬 작업, 스킬 테스트 위임 |

**산출물**: 나만의 SKILL.md 1개 + 에이전트 활용 경험

#### Day 4: 시스템화 (`/day4`)

| Block | 주제 | 학습 내용 |
|-------|------|----------|
| Block 0 | Context Engineering | 이 캠프의 정체, 업계 3대 교훈 |
| Block 1 | Compound Engineering | 풀 사이클 6단계 (Build→Use→Notice→Debug→Fix→Document) |
| Block 2 | GitHub 기초 | Repository, Commit, Branch, PR |
| Block 3 | 서비스화 | GitHub + Vercel + Supabase |
| Block 4 | Compound 실습 | CLAUDE.md 규칙 추가 사이클 체험 + 1주 목표 설정 |

**산출물**: 개선된 CLAUDE.md + 1주 목표

---

## 스킬 아키텍처

### STOP PROTOCOL (2-Phase 진행)

모든 Day의 각 블록은 **반드시 2턴**에 걸쳐 진행됩니다:

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

이 프로토콜은 한 턴에 모든 내용을 쏟아내는 것을 방지하고, 사용자가 각 단계를 소화할 시간을 확보합니다.

### SKILL.md 구조 (camp-1 품질 기준)

```markdown
---
name: day1-onboarding
description: "설명 + 호출 트리거 키워드"
---

# 제목

이 스킬이 호출되면 아래 STOP PROTOCOL을 반드시 따른다.

## 용어 정리                      ← 핵심 용어 테이블
## STOP PROTOCOL — 절대 위반 금지   ← ASCII 박스 다이어그램
  - 핵심 금지 사항 4가지
  - 공식 문서 URL 출력 규칙
  - Phase A 종료 시 필수 문구
## 소요 시간 가이드                 ← 블록별 예상 시간
## 핵심 전략                       ← 진행 흐름 요약
## 블록 특수 규칙                   ← 블록별 예외 사항
## References 파일 맵              ← 블록-파일 매핑 테이블
## 진행 규칙
## 시작 (AskUserQuestion으로 블록 선택)
## 마무리 (요약 테이블 + 산출물 확인)
```

### Per-Block Reference 파일 구조

```markdown
# Block N: 제목

> **Phase A 시작 시 반드시 아래 형태로 출력한다:**
> ```
> 📖 공식 문서: https://code.claude.com/docs/ko/...
> ```

## EXPLAIN
[핵심 개념 + 비유]

## EXECUTE          ← 실습이 있는 블록만
[단계별 실습 가이드]

## QUIZ             ← 퀴즈가 있는 블록만
[AskUserQuestion JSON + 정답 + 해설]
```

> 공식 문서 URL은 한국어 버전(code.claude.com/docs/ko/)을 사용합니다.

### 인터랙션 패턴

```
사용자: /day1
    ↓
Claude: SKILL.md 로딩 → AskUserQuestion으로 시작 블록 선택
    ↓
사용자: "Block 0부터"
    ↓
Claude: references/block0-*.md Read → EXPLAIN + EXECUTE 전달 → STOP
    ↓
사용자: "완료" 또는 "다음"
    ↓
Claude: QUIZ → AskUserQuestion으로 객관식 출제
    ↓
사용자: 답변 선택
    ↓
Claude: 정답/오답 해설 → "다음 블록으로 넘어갈까요?"
    ↓
사용자: "다음"
    ↓
Claude: references/block1-*.md Read → 다음 블록 시작
```

---

## 커스터마이징

### 퀴즈 문항 변경

`references/blockN-*.md`의 QUIZ 섹션에서 문항/선택지/해설을 직접 수정하면 됩니다.

### 새로운 Block 추가

`references/` 폴더에 새 `blockN-topic.md` 파일을 만들고, SKILL.md의 References 파일 맵 테이블에 추가합니다.

### 참조 자료 확장

`references/` 폴더에 추가 md 파일을 넣으면 SKILL.md에서 참조할 수 있습니다.

### 언어 변경

진행 가이드의 "모든 응답은 한국어로 한다" 규칙과 각 Block의 내용을 원하는 언어로 수정하세요.

---

## 사전 요구사항

- [Claude Code](https://claude.ai/code) 설치 및 인증
- macOS / Linux / Windows (WSL)
- 터미널 기본 조작 가능

---

## FAQ

**Q: 프로그래밍을 몰라도 되나요?**
네! 이 교육은 비개발자를 위해 설계되었습니다. 모든 기술 개념을 일상의 비유로 설명합니다.

**Q: Day를 순서대로 해야 하나요?**
권장합니다. Day 1→2→3→4 순서로 개념이 쌓이도록 설계되어 있습니다. 하지만 각 Day는 독립 스킬이므로 원하는 Day만 선택할 수도 있습니다.

**Q: 얼마나 걸리나요?**
각 Day는 60~75분 소요됩니다. 자신의 속도에 맞춰 진행하면 됩니다.

**Q: 퀴즈를 틀리면 어떻게 되나요?**
해설과 함께 정답을 알려주고, 다시 시도할 수 있습니다. 학습 목적이므로 부담 없이 도전하세요.

**Q: 스킬이 인식이 안 돼요**
1. `.claude/skills/` 폴더 안에 있는지 확인
2. SKILL.md 파일이 있는지 확인
3. frontmatter(`---` 블록)가 올바른지 확인
4. Claude Code 재시작

---

## 핵심 개념 한눈에 보기

| 개념 | 비유 | Day |
|------|------|-----|
| CLAUDE.md | 신입 업무 매뉴얼 | 1 |
| Skill | 요리 레시피 | 1, 3 |
| MCP | USB-C 포트 | 1, 2 |
| Subagent | 부하 직원 위임 | 2 |
| Clarify | 모호함→명확함 | 3 |
| 스킬 체이닝 | 공장 생산라인 | 3 |
| Context Engineering | 맥락 설계 | 4 |
| Compound Engineering | 복리 이자 | 4 |
| git commit | 게임 세이브 | 1, 4 |
| GitHub | 작가의 작업실 | 4 |
| Vercel | 자동 발행 시스템 | 4 |
| Supabase | 독자 관리 + 데이터 | 4 |

---

## 라이선스

이 교육 자료는 자유롭게 사용, 수정, 공유할 수 있습니다.
