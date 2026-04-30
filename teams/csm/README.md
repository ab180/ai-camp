# AI Camp · CSM 팀

AB180 CS Group 전용 AI Camp 3기 자산. **4일 집중 캠프 + 1주 사이클 × 2회 + 2026-05-15(금) 발표회**.

```
Day 1 — 뼈대            Day 2 — 도구·첫 사이클     Day 3 — 본인 적용·반복     Day 4 — 검증·복리
   ↓                       ↓                          ↓                            ↓
CLAUDE.md (구조)       MCP + 1사이클 + Git         사이클 반복 + Subagent       까다로운 고객 + Compound
                                                  + 스킬 체이닝                + 팀 repo PR
```

---

## 사전 준비

1. **Claude Code 설치** — https://claude.com/product/claude-code
2. **MCP 사전 연동** — claude.ai → Settings → Integrations에서 Gmail·Notion·Slack 중 본인 업무에 자주 쓰는 것 1개 연결
3. **이 폴더 받기**

   ```bash
   curl -fsSL https://raw.githubusercontent.com/ab180/ai-camp/main/bin/setup.sh | bash -s csm
   cd ai-camp-csm/teams/csm
   claude
   ```

---

## 6축 프레임 (학습의 뼈대)

이번 캠프 4일은 이 6축을 몸으로 익히는 과정이다. "질문 하나 던지기"가 아니라 6축을 반복해야 AI가 내 일처럼 일한다.

| 축 | 정의 | 활성 Day |
|----|------|---------|
| **1. 구조** | AI가 "어디서·어떤 규칙으로" 일하는지 뼈대. CLAUDE.md·rules | Day 1 |
| **2. 맥락** | 지금 작업에 필요한 변하는 정보. MCP·외부 데이터 | Day 1·2 |
| **3. 계획** | "무엇을·어떤 순서로·왜" — Clarify·Deep Interview | Day 2·3 |
| **4. 실행** | 짠 계획대로 스킬·Subagent 호출 | Day 2·3 |
| **5. 검증** | 만든 사람 ≠ 점검하는 사람 (Generator ≠ Evaluator) | Day 4 |
| **6. 개선** | 검증 결과를 스킬·rules에 되먹임 (Build → Use → Notice → Fix) | Day 4 + 1주 사이클 |

```
   1. 구조 ─┐
            ├─→ 4. 실행 ─→ 5. 검증 ─→ 6. 개선 ─┐
   2. 맥락 ─┘                                   │
                                                ↓
   3. 계획 ─────────────────────→ 다시 1·2·3·4 (복리)
```

---

## 4일 흐름

| Day | 주제 | 시간 | 슬라이드 | 산출물 |
|-----|------|------|---------|--------|
| **Day 0** | Intro — AI랑 일한다는 건 어떻게 일한다는 걸까 | 12분 | 12장 | (Day 1 시작 전 인트로) |
| **Day 1** | 뼈대 깔기 — CLAUDE.md 설계 (축 1+2) | 120분 | 59장 | CSM 맥락·톤·금지어 담은 CLAUDE.md |
| **Day 2** | 도구 연결(MCP) + 첫 1사이클 (축 2+3) | 120분 | 52장 | MCP 1개+ 연결 + 본인 스킬 첫 초안 + PR 1개 |
| **Day 3** | 본인 적용 + Subagent 본격 (축 3+4) | 120분 | 34장 | 사이클 결과 2-3건 + Subagent 1회 + 머지된 PR |
| **Day 4** | 검증 + 개선 + 팀 공유 (축 5+6) | 120분 | 53장 | 까다로운 고객 피드백 + 6축 자가진단 + 팀 PR + 회고 |

각 Day는 **슬라이드(발표) → 실습 → 짝꿍 점검** 흐름.

---

## 핵심 개념 시각화

### 1사이클 — Day 2부터 매일 반복하는 흐름

```
     ┌─────────────────────────────────────┐
     │                                     │
     ↓                                     │
  자연어로 부탁  ───────→  SKILL.md 읽기   │
  "이거 해줘"               (입력값·출력 확인)
                                │           │
                                ↓           │
                          Clarify 4가지     │
                          (독자·입력·       │
                           출력·성공기준)   │
                                │           │
                                ↓           │
                            재부탁 ─────────┘
                          (90% 결과)
```

**70 → 90% 체감**: 첫 자연어 부탁은 70%. Clarify 후 재부탁이 90%. 한 번에 100% 안 옴.

---

### Subagent 3패턴 (Day 3 B2)

```
┌── 패턴 1: 병렬 검색 (시간 단축) ──┐
│  메인 ─┬─ Sub A: 고객 1 분석     │
│         ├─ Sub B: 고객 2 분석     │
│         └─ Sub C: 고객 3 분석    │
│         ↓ (동시 실행)            │
│  메인 ← 결과 합침                │
└──────────────────────────────────┘

┌── 패턴 2: 역할 분리 (품질 향상) ──┐
│  Sub A (Generator): 메일 작성     │
│       ↓                           │
│  Sub B (Evaluator): 까다로운 고객 │
│       페르소나로 검토              │
│       ↓                           │
│  메인 ← 검토 의견 받아 수정       │
└──────────────────────────────────┘

┌── 패턴 3: 컨텍스트 보호 ──────────┐
│  Sub: 100p 회의록 분석           │
│       ↓ (메인 컨텍스트 깨끗)     │
│  메인 ← 핵심 3줄만 받음          │
└──────────────────────────────────┘
```

---

### 스킬 체이닝 (Day 3 B2 보너스)

```
[입력] → [스킬 A] → [중간 결과] → [스킬 B] → [최종]
        리캡 메일               톤·금지어
        작성                    검토

핵심: 스킬 A 출력 = 스킬 B 입력. 본인이 매번 손으로 옮길 필요 X.
```

---

### Compound 사이클 (Day 4 B2)

```
    Build  ←──────────┐
      ↓               │
     Use              │
      ↓               │
   Notice (3회 반복)   │
      ↓               │
    Fix ──────────────┘ (rules·CLAUDE.md 반영)
```

**3번 반복 규칙**: 한 번 = 우연. 두 번 = 의심. 세 번 = 구조적 결함 → 스킬에 박는다.

---

### 검증 도구 2종 (Day 4 B1)

```
┌── 까다로운 고객 ────────────┐    ┌── Skill Creator ────────────┐
│ 검증 대상: 결과물 (메일)    │    │ 검증 대상: 스킬 자체 (.md)  │
│ 강점: 사용자 경험 시각      │    │ 강점: 스킬 구조·완성도      │
│ 출력: 지적·근거·제안 3단    │    │ 출력: 부족·모호·누락 리포트 │
└────────────────────────────┘    └────────────────────────────┘
                ↓                              ↓
        둘 다 돌리면 양쪽 약점이 잡힘 (Anthropic 검증 패턴)
```

---

### Git/PR 협업 한 사이클 (Day 3 B3)

```
[어제 PR 올림]
     ↓
1. 짝꿍이 코멘트 ("출력 형태 가이드 모호")
     ↓
2. 본인이 답 + 수정 commit
     ↓
3. 같은 PR에 push (자동 업데이트)
     ↓
4. 짝꿍 승인 → Squash merge
     ↓
5. git pull로 main 동기화
```

Day 2는 "올리기"까지. Day 3는 한 바퀴 완주.

---

## 산출물 누적

```
Day 1 끝: CLAUDE.md (1개)
Day 2 끝: + MCP 연결 (1개+) + 본인 스킬 (1개) + PR (1개)
Day 3 끝: + 사이클 결과 (2-3건) + Subagent (1회) + 머지된 PR (1개)
Day 4 끝: + Skill Creator 리포트 + 까다로운 고객 피드백 + 6축 O/X
          + Compound 파이프라인 1단 + 팀 PR (1개) + 회고 1줄

1주 사이클 × 2회 후: 본인 업무에 3회+ 적용 + rules 추가 + 발표 준비
```

---

## 발표 자료 열람

각 Day 폴더의 `viewer.html`을 브라우저에서 열면 키보드 ←→로 슬라이드 이동.

```
slides/
├── day0-intro/viewer.html               · 12장 (인트로)
├── day1-structure-context/viewer.html   · 59장
├── day2-context/viewer.html             · 52장
├── day3-plan-execute/viewer.html        · 34장
└── day4-validate-improve/viewer.html    · 53장 (본 46장 + 부록 7장)
```

`file:///.../viewer.html?nocache=$(date +%s)` 형식으로 캐시 우회.

---

## 폴더 구조

```
teams/csm/
├── README.md                                  (본 문서)
├── slides/                                    Day별 발표 슬라이드 (HTML + viewer)
│   ├── day0-intro/                            12장
│   ├── day1-structure-context/                59장
│   ├── day2-context/                          52장
│   ├── day3-plan-execute/                     34장
│   └── day4-validate-improve/                 46장 + 부록 7장
└── .claude/skills/                            학습 스킬 (자가학습 인터랙티브)
    ├── day1-structure-context/                Day 1 자가학습용
    ├── day2-context/                          Day 2 자가학습용
    ├── day3-plan-execute/                     Day 3 (B0~B4 + STOP PROTOCOL)
    ├── day4-validate-improve/                 Day 4 (B0~B4 + 부록)
    └── reply-csm/                             환경 의존 학습 스킬
```

각 학습 스킬은 `cd teams/csm && claude` 후 `/day{N}-...` 또는 슬래시 명령으로 호출.

---

## 학습 스킬 진행 방식

| 단계 | 행동 |
|------|------|
| Phase A | EXPLAIN(개념 설명) + EXECUTE(실습 안내) → STOP |
| 사용자 | 직접 실습 |
| 사용자 입력 | "완료" 또는 "다음" |
| Phase B | QUIZ(객관식) + 다음 블록 이동 묻기 |

각 Day 스킬은 **2턴 기반 STOP PROTOCOL** 따른다. 한 턴에 EXPLAIN + QUIZ 동시 X.

---

## 실습 중 막힐 때

| 증상 | 대응 |
|------|------|
| MCP 연결 안 됨 | 운영진 + 짝꿍 5분 사이드. 90%는 claude.ai 재로그인 또는 Claude Code 재시작 |
| `/mcp`에 서버 안 보임 | Claude Code 세션 재시작 (종료 후 다시 `claude`) |
| 스킬이 이상한 결과 | 첫 결과 70%면 정상. Clarify 4가지로 재부탁 (Day 2·3에서 다룸) |
| Git 명령이 무섭다 | Day 2 B7, Day 3 B3, Day 4 B3에서 UI 중심 풀이. 터미널 없이 GitHub 웹 가능 |
| 슬라이드 안 보임 | viewer.html 캐시 — `?nocache=<timestamp>` 쿼리 추가 또는 Cmd+Shift+R |

---

## 캠프 종료 후 — 1주 사이클 × 2회

```
Week 1 (1주차):
  - 본인 스킬 3개 케이스에 적용
  - 매 세션 끝 /wrap 호출
  - signals/compound-log.json 누적
  - 까다로운 고객 페르소나 본인 회사 맞게 수정

Week 2 (2주차):
  - 1주차 wrap 신호 분석 → 3회 반복 패턴
  - rules/ 또는 SKILL.md에 추가 → PR
  - "별로였던 것 / 좋았던 것 각 2문장" 회고 메모

5/15(금) 발표회:
  - 본인 변화량 (스킬 개수, wrap 누적 신호, PR 수)
  - 다음 분기 계획
```

**회고 포맷** — 4기 설계 인풋: "별로였던 것 2문장 / 좋았던 것 2문장"

---

## Day 4 부록 (자율 학습)

본 콘텐츠 끝나고 시간 남거나 캠프 후 자율 학습용. 7장 슬라이드.

| 부록 | 주제 | 활용 시나리오 |
|------|------|--------------|
| Vercel (3장) | GitHub repo → 공개 URL 5분 | 본인 CLAUDE.md 외부 공유 / 신규 입사자 온보딩 / 스킬 카탈로그 |
| Supabase (3장) | 팀 공용 DB + API + MCP | 케이스 DB / wrap 신호 팀 누적 / 스킬 실행 로그 |
| 마무리 (1장) | 까다로운 고객 프롬프트 전문 + 학습 리소스 | 본인 회사 맞게 페르소나 수정 |

---

## 참고

- 1·2기 기록: `../../archive/camp-1-2/`
- **3기 Notion 커리큘럼**: https://www.notion.so/ab180/Ai-3-343a69a82507809d9248f71daebaef3a
- 공식 문서: https://code.claude.com/docs/ko/overview
