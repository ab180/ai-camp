# AI Camp · CSM 팀

AB180 CS Group 전용 AI Camp 3기 자산. 4일 집중 캠프 + 2주 프로젝트 + **2026-05-15(금) 발표회**.

---

## 사전 준비

1. **Claude Code 설치** — https://claude.com/product/claude-code
2. **MCP 사전 연동** — claude.ai Settings → Integrations에서 Gmail·Notion·Slack 중 본인 업무에 자주 쓰는 것 1개 연결 (가이드: 운영진 배포 예정)
3. **이 폴더 받기**

   ```bash
   curl -fsSL https://raw.githubusercontent.com/ab180/ai-camp/main/bin/setup.sh | bash -s csm
   cd ai-camp-csm/teams/csm
   claude
   ```

---

## 4일 흐름

| Day | 주제 | 시간 | 산출물 |
|-----|------|------|--------|
| **Day 0** | Intro — AI랑 일한다는 건 어떻게 일한다는 걸까 | 12분 | (Day 1 시작 전 인트로 · 12장) |
| **Day 1** | 뼈대 깔기 — CLAUDE.md 설계 | 120분 | CSM 맥락·톤·금지어를 담은 CLAUDE.md |
| **Day 2** | 도구 연결(MCP) + 내 스킬 만들기 | 120분 | MCP 1개+ 연결 + 내 문제 스킬 첫 초안 |
| **Day 3** | Deep Interview · 템플릿 커스터마이징 · Skill Creator | 120분 | 내 맥락으로 다듬은 동작 스킬 + 검증 결과 |
| **Day 4** | 까다로운 고객 + 6축 자가진단 + 팀 repo | 120분 | 검증 피드백 + 6축 O/X + 팀 repo 업로드 |

각 Day는 **슬라이드(발표) → 실습 → 짝꿍 점검** 흐름. Day 0는 본편 직전 인트로 — "AI를 OS로 본다"라는 메인 비유로 분업 모델 3단계와 캠프 동기를 던진다.

---

## 발표 자료 열람

각 Day 폴더의 `viewer.html`을 브라우저에서 열면 키보드 ←→로 슬라이드 이동.

```
slides/
├── day0-intro/viewer.html               · 12장 (인트로)
├── day1-structure-context/viewer.html   · 59장
├── day2-context/viewer.html             · 52장
├── day3-plan-execute/viewer.html        · 47장
└── day4-validate-improve/viewer.html    · 45장
```

---

## 폴더 구조

```
teams/csm/
├── README.md               (본 문서)
├── slides/                 Day별 발표 슬라이드 (HTML + viewer)
├── templates/              운영진 사전 제작 스킬 (리캡 메일·문의 답변·미팅 노트 요약·Subagent 예제)
│                           · Day 3에서 내 업무 맥락으로 수정 (0.5 → 1)
├── .claude/skills/         내 스킬 작업 공간
│                           · Day 2 B6에서 첫 스킬 생성
│                           · day1~4 참가자용 인터랙티브 복습 스킬 포함
└── guides/                 Day별 발표자 가이드 MD
```

---

## 실습 중 막힐 때

| 증상 | 대응 |
|------|------|
| MCP 연결이 안 된다 | 운영진 + 짝꿍과 5분 사이드 세션. 90%는 claude.ai 재로그인 또는 Claude Code 재시작으로 해결 |
| `/mcp` 명령 결과에 서버가 안 보인다 | Claude Code 세션 재시작 (종료 후 다시 `claude`) |
| 스킬이 이상한 결과를 낸다 | 첫 결과 70%면 정상. 고치지 말고 Day 3 Deep Interview까지 들고 오기 |
| Git 명령이 무섭다 | Day 2 B7, Day 4 B3에서 UI 중심으로 풀이. 터미널 없이 GitHub 웹에서 해결 가능 |

---

## 캠프 종료 후

- **2주 프로젝트**: 오늘 만든 스킬을 본인 업무에 실제 적용. 막힌 지점 기록.
- **2026-05-15(금) 발표회**: 2주 동안의 경험 공유.
- **회고 포맷**: "좋았던 것 2문장 / 별로였던 것 2문장" — 4기 설계 인풋이 된다.

---

## 참고

- 공통 자산: `../../shared/`
- 운영진 매뉴얼: `../../sop/`
- 1·2기 기록: `../../archive/camp-1-2/`
- **3기 Notion 커리큘럼**: https://www.notion.so/ab180/Ai-3-343a69a82507809d9248f71daebaef3a
