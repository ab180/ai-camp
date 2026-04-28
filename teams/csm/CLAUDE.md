# CLAUDE.md — teams/csm (AI Camp 3기 저장소 컨텍스트)

> 이 파일은 **저장소 운영 컨텍스트**다 (슬라이드 빌드·CI·sparse-checkout). 개인 CSM 컨텍스트(이메일 원칙·응대 스타일·고객 응대)는 루트 `CLAUDE.md` 참고.
> 슬라이드·스킬 작업은 `cd teams/csm && claude` 로 이 디렉토리에서 시작한다.

## What this repo is

AB180 사내 AI Camp 3기 자산 저장소. **코드 프로젝트가 아니라 교육용 콘텐츠 저장소** — 정적 HTML 슬라이드 + Claude Code 스킬(SKILL.md)이 1차 산출물이다. 4일 캠프 + 2주 프로젝트 + 발표회(2026-05-15) 흐름을 지원한다.

## Sparse checkout

이 워킹트리는 sparse-checkout 상태(`.git/info/sparse-checkout`)다. 현재 활성 패턴은 `teams/csm/`, `archive/`, `shared/`만 — `.github/`, `bin/`, `docs/`, 다른 팀(`teams/sales/` 등)은 **로컬에 없지만 git에는 존재**한다. 누락된 파일이 보일 때 추가/수정하려면 sparse 패턴을 먼저 넓혀야 한다 (`git sparse-checkout add <path>`). 보이지 않는 파일을 잠깐 확인할 때는 `git show HEAD:<path>`.

## High-level layout

```
teams/csm/
├── slides/<day>/                 Day별 슬라이드 (slide-NN.html + viewer.html + assets/warm-neutral.css)
│   └── slide-outline.md          Day의 슬라이드 톤·구조 SSOT (각 슬라이드 의도/스크립트)
├── .claude/skills/<skill>/       Claude Code 자동 로드 스킬
│   ├── SKILL.md                  frontmatter(name·description) + 본문 — CI에서 frontmatter 검증
│   └── references/               개념 중심 참고 자료
└── README.md                     캠프 진행 안내(참가자용)

archive/camp-1-2/                 1·2기 자산 (읽기 전용 — 새 변경 금지)
```

핵심: `slide-outline.md`가 슬라이드 군의 SSOT다. 슬라이드를 추가/수정하기 전에 outline부터 본다 — 톤/스타일/금지어/3단 구조 규칙이 거기 명시돼 있다.

## Slide system

- **viewer.html**: 같은 Day의 `slide-*.html`을 ←→ 키로 넘기는 정적 뷰어. 빌드 산출물 — 직접 편집하지 말고 `slides-grab build-viewer`로 재생성.
- **assets/warm-neutral.css**: 4개 Day 공유 스타일. Warm Neutral 팔레트 — 크림 `#f5ede2` + 테라코타 `#c56a4a`, rounded sans.
- **슬라이드 톤 원칙** (outline에서 따옴):
  - 개념 슬라이드 = `정의 + 왜 중요 + CSM 예시` 3단 구조
  - **금지**: 장식 이모지(🚕🚄), 장식 화살표(↓↻→), 드롭섀도, 그라디언트 배경, 숫자 폭격, FOMO, 기업 로고
  - 제목은 Notion 3기 스펙 용어 그대로 — 내부 코드네임(예: "뼈대 깔기") X
  - CI가 비권장 표현(`0.5판`, `뼈대 깔기`) 경고로 잡는다 (차단 X, 점진 개선)

## Common operations

```bash
# 슬라이드 미리보기 (로컬 브라우저)
open teams/csm/slides/day1-structure-context/viewer.html

# 슬라이드 한 Day 구조 검증 (CI와 동일)
slides-grab validate --slides-dir teams/csm/slides/day1-structure-context

# slide-NN.html 추가/수정 후 viewer.html 재생성
slides-grab build-viewer --slides-dir teams/csm/slides/day1-structure-context

# 캠프 학습 스킬 직접 호출 (참가자 시점 재현)
cd teams/csm && claude
# 그리고 /reply-csm, /day1-structure-context, /day2-context, /day3-plan-execute, /day4-validate-improve
```

`slides-grab`은 글로벌 npm 패키지(`slides-grab@1.2.2`). 처음이면 `npm install -g slides-grab@1.2.2`.

## CI gates (pull request)

`.github/workflows/validate.yml`이 머지 전에 다음을 확인한다:

1. **필수 디렉토리** 4개 Day 슬라이드 + `.claude/skills/` + `docs/plans/` + `archive/camp-1-2/` + `bin/`
2. **각 Day**에 `viewer.html`, `assets/warm-neutral.css`, 최소 1개 `slide-*.html`
3. **slides-grab validate** — `missing-assets`, `validation-failed`, `missing-file` 에러는 차단. `overflow-outside-frame`은 경고만 (Linux CI ↔ macOS 렌더링 차이로 노이즈 多).
4. **build-viewer dry run** — 빌드 실패 시 차단
5. **SKILL.md frontmatter** — `---` fence + `name:` + `description:` 필수
6. **bin/setup.sh** 문법 체크

CI는 Playwright Chromium + Pretendard 폰트(없으면 Noto CJK fallback)로 실행. 로컬에서 똑같이 재현하려면 같은 폰트가 있어야 overflow 결과가 일치한다.

## Skill conventions (.claude/skills/)

- 폴더명 = 스킬 이름 = `SKILL.md` frontmatter `name`. **세 곳이 일치**해야 호출 가능.
- `description`은 호출 트리거를 구체적으로 — Claude Code가 이 문장으로 호출 여부를 판단한다 (예: "1일차/Day 1/CLAUDE.md 요청에 사용").
- 스킬 종류:
  - **학습 스킬** (`day1-structure-context` ~ `day4-validate-improve`): 자가학습용 인터랙티브. 캠프 슬라이드와 짝.
  - **운영진 학습 도구** (`reply-csm`): 같은 입력에 환경(CLAUDE.md/MCP)이 두꺼워질수록 답이 좋아지는 학습 효과 측정용. 본인 워크플로우 자동화 스킬과 섞지 않는다.

## Archive

`archive/camp-1-2/`는 1·2기 원본(PDF·script·legacy skill). **수정 금지** — 회고 입력 자료다. 새 캠프 자산은 항상 `teams/<team>/`에 만든다.

## Tone (참가자 대상 문서·슬라이드)

- 한국어 기본. 비개발자가 많아 터미널 공포 완화 — 막힐 때 GitHub 웹 UI 우회 경로를 항상 함께 제시 (`teams/csm/README.md`의 "실습 중 막힐 때" 참고).
- "스킬 첫 결과 70%면 정상" 원칙 — 즉석에서 고치도록 권하지 않는다. Day 3 Deep Interview까지 들고 오게 한다.
