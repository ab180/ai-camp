# AI Camp

AB180 사내 Claude Code 기반 AI-Native 워크플로우 캠프. CS Group 팀장 6명 + 짝꿍 6명(3기) 대상.

> 도구 사용법이 아니라, **AI와 함께 일하는 방식의 새로운 뼈대**를 체득하는 4일 과정.

---

## 한눈에 보기 — 하네스 6축 × 4 Day

| Day | 시간 | 축 | 테마 | 산출물 |
|-----|------|------|------|--------|
| **Day 1** | 120분 | 축 1(구조) + 축 2(살짝) | 뼈대 깔기 — CLAUDE.md | CSM 맥락·톤·금지어가 박힌 CLAUDE.md |
| **Day 2** | 120분 | 축 2(맥락) | 도구로 맥락 확장 — MCP | CSM 도구 MCP 1개+ 연결 |
| **Day 3** | 120분 | 축 3(계획) + 축 4(실행) | 템플릿 커스터마이징 | 운영진 스킬 템플릿을 내 업무로 0.5→1 수정 |
| **Day 4** | 120분 | 축 5(검증) + 축 6(개선) | 까다로운 고객 + 6축 자가진단 | 검증 피드백 메모 + 6축 O/X + 팀 repo 업로드 |

### 하네스 6축

1. **구조** — AI가 내 업무를 "어디서·어떤 규칙으로" 이해하게 만드는 뼈대 (CLAUDE.md·폴더·rules)
2. **맥락** — 지금 이 작업에 필요한 "변하는 정보"를 AI가 접근하게 연결 (MCP·외부 데이터)
3. **계획** — 바로 실행 X. "무엇을·어떤 순서로·왜"를 먼저 (Clarify·Ouroboros)
4. **실행** — 짠 계획대로 스킬·Subagent 호출
5. **검증** — 다른 관점으로 점검 (Generator ≠ Evaluator)
6. **개선** — 검증 결과를 스킬·rules에 되먹임 (Build → Use → Notice → Fix)

---

## Repo 구조

```
ai-camp/
├── slides/                         # grab 기반 PPT (outline + HTML + PDF)
│   ├── day1-structure-context/
│   ├── day2-context/
│   ├── day3-plan-execute/
│   └── day4-validate-improve/
├── guides/                         # 발표자 가이드 MD (Day별)
├── .claude/skills/                 # 참가자용 인터랙티브 복습 스킬
│   ├── day1-structure-context/
│   ├── day2-context/
│   ├── day3-plan-execute/
│   └── day4-validate-improve/
├── templates/                      # 운영진 사전 제작 스킬 템플릿 (0.5→1 수정 대상)
│   ├── recap-mail/
│   ├── inquiry-response/
│   ├── meeting-note-summary/
│   └── subagent-example/
├── sop/                            # 운영진 운영 매뉴얼
│   ├── validator-agent-script.md   # "까다로운 고객" 에이전트 시연
│   ├── 6axes-self-assessment.md    # Day 4 O/X 체크리스트
│   └── pre-camp-checklist.md
├── docs/plans/                     # Design Doc·계획
│   └── 2026-04-20-ai-camp-3rd-design.md
└── archive/camp-1-2/               # 1·2기 자산 보존 (읽기 전용)
    ├── original-pdfs/
    ├── pdfs/
    ├── scripts/
    ├── lecture-guides/
    ├── legacy-skills/
    ├── legacy-plans/
    └── README-camp-1-2.md
```

---

## 제작 원칙

- **Day 템플릿 단위 재사용**: 6축 흐름 뼈대를 유지. 예시(CSM-specific)는 슬라이드 본문에 섞음. 다음 기수/다른 부서 적용 시 `slide-outline.md` 복사 → 예시 교체 → 재-grab.
- **비개발자 허들 ↓**: 스킬은 0→1이 아닌 **0.5→1** (운영진 템플릿 수정). 검증은 운영진 시연만, 참가자는 피드백 읽기.
- **짝꿍 협업**: Day 3 "어제까지 답답함" 회고, Day 4 6축 자가진단 상호 검토.

---

## 현재 상태

| Phase | 상태 | 산출물 |
|-------|------|--------|
| A. 2기 분석 + 매트릭스 | ✅ 완료 | [Design Doc §5](docs/plans/2026-04-20-ai-camp-3rd-design.md) |
| B. Design Doc | ✅ 완료 | [`docs/plans/2026-04-20-ai-camp-3rd-design.md`](docs/plans/2026-04-20-ai-camp-3rd-design.md) |
| C. Repo bootstrap | 🚧 진행 중 | 본 scaffold |
| D1~D4. Day별 slides-grab | ⏳ 대기 | — |
| E. Supporting 자산 | ⏳ 대기 | — |
| F. README 최종 + push | ⏳ 대기 | — |

---

## 참고

- **3기 Notion**: `https://www.notion.so/ab180/Ai-3-343a69a82507809d9248f71daebaef3a`
- **1·2기 자산**: `archive/camp-1-2/` (원본 PDF, 스크립트, 강의 가이드, legacy skill)
- **Design Doc**: [`docs/plans/2026-04-20-ai-camp-3rd-design.md`](docs/plans/2026-04-20-ai-camp-3rd-design.md)
