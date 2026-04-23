<!-- 업데이트: 2026-04-22 · teams/ 구조로 재편 (slides/, templates/, .claude/skills/, guides/ → teams/csm/ 하위 이동) -->
---
title: AI Camp 3기 전면 재편 — Design Doc
date: 2026-04-20
status: APPROVED
scope: L (repo 신규 + 4 Day 슬라이드 전면 재제작 + Supporting 자산)
---

# AI Camp 3기 재편 — Design Doc

## 1. 배경

- **1·2기**: `song-yechan/ai-native-camp-skills` (개인 repo). PDF 원본, 강의 가이드 MD 4개, `.claude/skills/day1-onboarding/` 구조, EXPLAIN→EXECUTE→QUIZ 패턴
- **3기**: CS Group 팀장 6명 + 짝꿍 6명 (비개발자 1기). 팀장 중심 + 짝꿍 동반
- **핵심 변화**: 하네스 6축 프레임 도입, CSM 특화, 120분/Day 표준, 비개발자 허들 ↓
- **대상 repo**: `ab180/ai-camp` (조직 repo, 신규)
- **제작 방식**: `slides-grab` 워크플로우로 PPT 재제작

SSOT 출처:
- Notion 3기 스펙: `https://www.notion.so/ab180/Ai-3-343a69a82507809d9248f71daebaef3a`
- 2기 가이드 MD: `lecture/day1_lecture_guide_complete.md` 외 3개

## 2. 목표

1. `ab180/ai-camp` 조직 repo에 3기 전체 자산 통합
2. 슬라이드는 **Day 템플릿 단위 재사용** 설계. 예시는 본문에 섞되, 다음 기수 때 outline 기반 재-grab
3. 1·2기 자산은 `archive/`로 보존
4. 하네스 6축 전반 흐름을 Day 1~4에 녹여 넣음

## 3. Repo 구조

> 업데이트: 2026-04-22 · teams/ 구조로 재편. slides/, templates/, .claude/skills/, guides/ → teams/csm/ 하위로 이동.

```
ab180/ai-camp/
├── README.md                          # 팀 구조 + 참가자 시작 가이드
├── teams/
│   ├── csm/                           # CS Group 전용
│   │   ├── README.md
│   │   ├── slides/                    # grab 산출물
│   │   │   ├── day1-structure-context/  # 축 1·2 살짝
│   │   │   ├── day2-context/            # 축 2
│   │   │   ├── day3-plan-execute/       # 축 3·4
│   │   │   └── day4-validate-improve/   # 축 5·6
│   │   ├── templates/                 # 운영진 사전 제작 스킬 템플릿 (0.5→1 수정 대상)
│   │   │   ├── recap-mail/
│   │   │   ├── inquiry-response/
│   │   │   ├── meeting-note-summary/
│   │   │   └── subagent-example/
│   │   ├── .claude/skills/            # 참가자용 인터랙티브 복습 스킬
│   │   │   ├── day1-structure-context/
│   │   │   ├── day2-context/
│   │   │   ├── day3-plan-execute/
│   │   │   └── day4-validate-improve/
│   │   └── guides/                    # 발표자 가이드 MD
│   └── (sales/ 등 추가 예정)
├── shared/                            # 팀 무관 공통 자산 (참고용)
│   └── README.md
├── sop/                               # 운영진 운영 매뉴얼
│   ├── validator-agent-script.md      # "까다로운 고객" 에이전트 시연
│   ├── 6axes-self-assessment.md       # Day 4 O/X 체크리스트
│   └── pre-camp-checklist.md
├── docs/plans/                        # Design Doc·계획
├── archive/
│   └── camp-1-2/                      # 1·2기 자산 보존
│       ├── original-pdfs/
│       ├── lecture-guides/
│       └── legacy-skills/
└── bin/setup.sh                       # 팀별 부분 clone 스크립트
```

## 4. 하네스 6축 매핑

| Day | 시간 | 축 | 테마 |
|-----|------|------|------|
| Day 1 | 120분 | 축 1(구조) + 축 2(살짝) | 뼈대 깔기 — CLAUDE.md |
| Day 2 | 120분 | 축 2(맥락) | 도구로 맥락 확장 — MCP |
| Day 3 | 120분 | 축 3(계획) + 축 4(실행) | 템플릿 커스터마이징 — Ouroboros + 스킬 + Subagent |
| Day 4 | 120분 | 축 5(검증) + 축 6(개선) | 검증 원리 + 복리 — 까다로운 고객 + 6축 자가진단 + 팀 repo |

## 5. Day별 Outline 스펙

### Day 1: 뼈대 깔기 (120분)

| 블록 | 시간 | 내용 | 축 |
|------|------|------|----|
| 인트로 3막 "왜" | 12분 | **1막** 왜 써야(이메일 3분 + KTX) / **2막** 왜 배워야(디버깅 마인드셋 + 맥락 복리) / **3막** 왜 리더(AX 꼭짓점 + Human bottleneck) | — |
| 6축 프레임 + 4 Day 로드맵 | 15분 | 6축 전체 소개, Day별 축 매핑, 오늘의 축 예고 | — |
| Part A 압축 | 15분 | 지식노동자 변화 + Allocation Economy + AI Native 워크플로우 | — |
| CLAUDE.md 실습 | 70분 | Setup → 리캡메일 데모 → `/init` → CSM 맥락·톤·금지어 커스터마이징 | 축 1 |
| 마무리 | 8분 | 6축 자기진단(축1 O/X) + Day 2 예고 | — |

### Day 2: 도구로 맥락 확장 (120분)

| 블록 | 시간 | 내용 | 축 |
|------|------|------|----|
| 오늘의 축 + Day 1 리뷰 | 10분 | 축 2 안내, Day 1 답답함 공감 | 축 2 |
| 맥락의 힘 | 15분 | 같은 질문 다른 맥락 — 고객 A/B 문의 대응 비교 | 축 2 |
| CSM 도구 맵 | 15분 | SFDC·Plain·Gmail·Notion·Slack 설계 철학 압축 | 축 2 |
| MCP 연결 실습 | 40분 | claude.ai 웹 설정 → CSM 핵심 1-2개 연결 + `/mcp` 확인 | 축 2 |
| "고객사 X 맥락 수집" 실습 | 35분 | CSM 리캡메일 시나리오 — SFDC + Slack + Notion 통합 수집 | 축 2 |
| 마무리 | 5분 | 자기진단(축2) + Day 3 예고 | — |

### Day 3: 계획 + 실행 (120분)

| 블록 | 시간 | 내용 | 축 |
|------|------|------|----|
| 오늘의 축 + Day 2 리뷰 | 10분 | 축 3·4 안내 | 축 3·4 |
| **어제까지 답답함 짝꿍 회고** | 15분 | 짝꿍과 "계획 없이 막 시켰을 때" 답답함 공유 | 축 3 |
| Ouroboros 실습 | 30분 | 각자 풀고 싶은 문제 → 구체 스펙 변환 | 축 3 |
| 스킬 제작 — 템플릿 수정 | 60분 | 운영진 리캡메일 템플릿 **0.5→1** 수정 (CSM 맥락·톤·키워드 교체) | 축 4 |
| Subagent 경험 | 15분 | 2분 개념 + 8분 운영진 예제 돌려보기(리캡메일 + 고객 히스토리 요약 병렬) + 5분 짝꿍 브레인스토밍 | 축 4 |
| 마무리 | 5분 | 자기진단(축3·4) | — |

*맹그로브·암묵지·미완의 방법 메타인지는 Ouroboros·스킬 수정 맥락에 자연스럽게 섞음*

### Day 4: 검증 + 개선 (120분)

| 블록 | 시간 | 내용 | 축 |
|------|------|------|----|
| 오늘의 축 + Day 1-3 리캡 | 10분 | 축 5·6 안내, "만든 것을 다른 관점으로" | 축 5·6 |
| **⭐ 검증 원리 시연** | 30분 | 운영진이 "까다로운 고객" 에이전트 시연 → 참가자는 자기 결과물 넣고 피드백 읽기만 (호출 허들 제거) | 축 5 |
| Compound + 6축 자가진단 | 30분 | Build→Use→Notice→Fix 원리 + O/X 체크리스트 1장 작성 | 축 6 |
| **짝꿍 상호 진단** | 15분 | 6축 자가진단 공유·대화 | 축 5·6 |
| GitHub 팀 repo | 25분 | 스킬 업로드 + README 6축 태그 (명령어 외우지 않음, 읽기 중심) | 축 6 |
| 1주 프로젝트 목표 | 10분 | 실무 적용 + 개선 사이클 1회. "별로였던 것 / 좋았던 것" 회고 안내 | — |

## 6. 재사용 원칙

- **Day 템플릿(프레임) = 재사용 단위**. 6축 흐름 뼈대 유지.
- **예시는 본문에 섞음**. 4기/다른 부서 적용 시 `slide-outline.md` 복사 → 예시 교체 → 재-grab.
- 슬라이드 파일 레벨 재사용 X. outline 레벨 재사용 O.

## 7. 공통 Cross-cutting 설계

1. **팀장 "레버리지 슬라이드" 삭제** (인위적) — 인트로 3막 §3에 "왜 리더인가"로 집약
2. **짝꿍 활용** — Day 3 회고 (B1) + Day 4 상호진단 (B4) 명시
3. **CSM-specific 예시** — 모든 Day: 리캡메일·고객 문의·미팅노트·까다로운 고객
4. **시간 표준화** — 120분/Day
5. **맹그로브·암묵지·미완의 방법** — Day 3(스킬 템플릿 수정) + Day 4(검증·복리) 맥락에 자연스럽게 배치. 인트로에는 넣지 않음

## 8. Phase 타임라인

| Phase | 작업 | 산출물 | 권장 세션 |
|-------|------|--------|----------|
| A | 2기 분석 + 매트릭스 | 본 Design Doc §5 | 현 세션 완료 |
| B | Design Doc | 본 문서 | 현 세션 (작성중) |
| C | Repo bootstrap | `ab180/ai-camp` scaffold, archive 이관 | 현 세션 또는 다음 |
| D1 | Day 1 slides-grab | outline.md + slide-XX.html + PDF | 독립 세션 권장 |
| D2 | Day 2 slides-grab | 동일 | 독립 세션 권장 |
| D3 | Day 3 slides-grab | 동일 | 독립 세션 권장 |
| D4 | Day 4 slides-grab | 동일 | 독립 세션 권장 |
| E | Supporting 자산 | 가이드 MD + 템플릿 + SOP | D와 병렬 가능 |
| F | README + 최종 | 6축 태그 README + push | 마지막 |

## 9. 결정 사항 (체크리스트)

- [x] Day 0 독립 X → Day 1 앞 인트로로 녹임
- [x] 예시 처리: 본문에 섞기. JSON 슬롯 분리 X. 다음 기수 때 재-grab
- [x] Repo 범위: 통합 (slides + guides + skills + templates + sop + archive)
- [x] 1·2기 자산: `archive/camp-1-2/` 보존
- [x] Day 1 인트로 3막(왜 써/왜 배워/왜 리더) **12분** — FOMO 아닌 본질
- [x] 팀장 "레버리지 슬라이드" 삭제 — 인위적
- [x] 짝꿍 활용: Day 3 회고 + Day 4 상호진단
- [x] 맹그로브·암묵지·미완의 방법 → Day 3·4 맥락에 섞음
- [x] 120분/Day 표준화
- [x] Day 4 ⭐ 검증 시연: 운영진 "까다로운 고객" 에이전트, 참가자는 피드백 읽기만

## 10. Open Questions / 후속 조치

- `ab180/ai-camp` repo 존재 여부 확인 (Phase C 착수 전 `gh repo view ab180/ai-camp` 또는 생성 권한 확인)
- 현 `song-yechan/ai-native-camp-skills` repo → archive 이관 범위 최종 확정 (PDF 원본·script.json·lecture MD·day*-onboarding 스킬 구조)
- slides-grab Day별 독립 세션 실행 시 main 세션에서 플랜 전달하는 방식
- 운영진 스킬 템플릿(리캡메일 등) 실제 CSM 업무 샘플 수집 방법 — 팀장 1-2명 공동 제작 권장 (Notion 스펙)

## 11. 참고

- Notion 3기 스펙: `https://www.notion.so/ab180/Ai-3-343a69a82507809d9248f71daebaef3a`
- 2기 가이드: `lecture/day*_lecture_guide*.md`
- 원본 PDF: `원본 - day*.pdf` (1·2기 촬영본)
- 인용 자산: "이메일 한 통 3분" 스토리 원문, LinkedIn Human bottleneck 시리즈 (5건), dumpling skill 포스트
