---
title: Claude Code 서브에이전트 & 스킬 — 공식 가이드 3문답
audience: 중학생도 이해 가능한 입문자
tone: 명확·도식 중심·불필요 워딩 0
style: bento-grid
deck_dir: slides
---

# 슬라이드 구조

## Slide 1 — Cover
- 타이틀: "서브에이전트 & 스킬, 공식이 말한 3가지"
- 부제: Anthropic 공식 문서 기반 정리 (2026-04 기준)
- 시각: 3개 질문 칩(Q1·Q2·Q3) bento 미리보기
- 출처 footer 자리 표시

## Slide 2 — TL;DR (한 장 요약)
- bento 3카드:
  - Q1 → "복잡도에 맞춰 1~10+개. 보통 2~4개"
  - Q2 → "공식적으로 불가능. 메인 세션에서 chain"
  - Q3 → "SKILL.md + Progressive Disclosure 3단계"
- 하단: "각 카드 = 이후 슬라이드 1장씩"

## Slide 3 — Q1. 서브에이전트 몇 개가 효율적?
- 핵심 도식: 작업 복잡도 → 권장 개수 막대(공식 인용)
  - 단순 사실 찾기: **1개** (3–10 tool calls)
  - 직접 비교: **2–4개** (10–15 calls each)
  - 복잡 리서치: **10개+**
- 안티패턴 카드: "단순 쿼리에 50개 spawn → 실패 사례"
- 비용 카드: "멀티에이전트 = 채팅 대비 약 15× 토큰"
- 출처: Anthropic Engineering — How we built our multi-agent research system

## Slide 4 — Q1 보충. 왜 더 많이 쓰면 손해인가
- 도식: 토큰 곡선 vs 성능 곡선 (단일 → 멀티)
- 인용 1: "에이전트는 채팅 대비 약 4× 토큰"
- 인용 2: "멀티에이전트는 채팅 대비 약 15× 토큰"
- 결론 박스: "작업 가치가 토큰 비용보다 클 때만 멀티 사용"
- 보너스: Opus 리드 + Sonnet 서브 = 단일 대비 +90.2% 성능

## Slide 5 — Q2. 서브에이전트가 또 서브에이전트를 부를 수 있나?
- 결론 박스(크게): **불가능 (공식)**
- 도식 비교 (tldraw 또는 HTML):
  - 왼쪽 ❌: Main → Sub → Sub (X 표시)
  - 오른쪽 ✅: Main → Sub_A · Sub_B · Sub_C (메인이 직접 chain)
- 이유 카드: "infinite nesting / recursive loop 방지"
- 대안 카드: "Skills 활용 또는 메인에서 직접 chain"
- 출처: code.claude.com/docs/en/sub-agents

## Slide 6 — Q3. 공식이 말한 효율적 스킬 구조
- bento 메인 도식: 디렉토리 트리
  ```
  my-skill/
  ├── SKILL.md      (필수)
  ├── reference.md  (필요 시)
  ├── examples/
  └── scripts/
  ```
- 사이드 카드: SKILL.md 최소 양식 (YAML frontmatter + 본문)
- 규칙 카드:
  - SKILL.md ≤ 500줄
  - description 1,536자 cap
  - description = "무엇을·언제 쓸지" 명시
- 출처: code.claude.com/docs/en/skills

## Slide 7 — Q3 핵심. Progressive Disclosure 3단계
- 3단 계단형 도식 (가장 중요한 시각화):
  - **1단계 — Metadata**: name + description 만 항상 로드 (저비용)
  - **2단계 — SKILL.md 본문**: 관련성 판단 시 로드
  - **3단계 — 번들 리소스**: 필요할 때만 선택 로드 (scripts·references·assets)
- 토큰 절약 메시지: "쓸 때만 로드 → 큰 자료도 평소엔 0 토큰"
- 출처: Anthropic Engineering — Equipping agents with Skills

## Slide 8 — 한 장 요약 + 체크리스트
- 좌측 핵심 답변 카드 3개 (Q1·Q2·Q3)
- 우측 실전 체크리스트:
  - [ ] 복잡도 모르면 일단 1개로 시작
  - [ ] 서브에이전트 안에서 또 spawn 시도 X
  - [ ] 스킬은 SKILL.md 1장 + 나머지 분리
  - [ ] description은 "언제 쓸지"를 첫 문장에

## Slide 9 — Sources (공식·공신력 출처)
- Anthropic Engineering — How we built our multi-agent research system
  - https://www.anthropic.com/engineering/multi-agent-research-system
- Anthropic Engineering — Equipping agents for the real world with Agent Skills
  - https://www.anthropic.com/engineering/equipping-agents-for-the-real-world-with-agent-skills
- Claude Code Docs — Create custom subagents
  - https://code.claude.com/docs/en/sub-agents
- Claude Code Docs — Extend Claude with skills
  - https://code.claude.com/docs/en/skills
- GitHub — anthropics/skills (공식 레포)
  - https://github.com/anthropics/skills
