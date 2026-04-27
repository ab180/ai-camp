#!/usr/bin/env bash
# AB180 AI Camp · 팀별 sparse-checkout + 글로벌 스킬 등록 (idempotent)
# Usage: curl -fsSL https://raw.githubusercontent.com/ab180/ai-camp/main/bin/setup.sh | bash -s <team>
#    예: bash -s csm
#
# 처음 실행: clone + 스킬 link
# 다시 실행: git pull + 스킬 link 재등록 (새 스킬 자동 반영)

set -euo pipefail

TEAM="${1:-}"
if [ -z "$TEAM" ]; then
  echo "사용법: setup.sh <team>"
  echo "예: setup.sh csm"
  exit 1
fi

TARGET_DIR="ai-camp-${TEAM}"
MODE="install"

if [ -d "$TARGET_DIR" ]; then
  if [ -d "$TARGET_DIR/.git" ]; then
    MODE="update"
    echo "→ $TARGET_DIR 이미 존재 — 업데이트 모드로 진행"
  else
    echo "⚠️  $TARGET_DIR 가 git repo가 아닙니다. 삭제하거나 다른 위치에서 실행해주세요."
    exit 1
  fi
fi

if [ "$MODE" = "install" ]; then
  echo "→ $TEAM 팀 폴더만 받아오는 중..."
  git clone --no-checkout --filter=blob:none https://github.com/ab180/ai-camp "$TARGET_DIR"
  cd "$TARGET_DIR"
  git sparse-checkout init --cone
  git sparse-checkout set "teams/$TEAM" "shared" "archive"
  git checkout
else
  echo "→ 최신 변경 가져오는 중 (git pull)..."
  cd "$TARGET_DIR"
  git pull --ff-only origin main 2>&1 | tail -3
fi

REPO_ABS="$(pwd)"
SKILLS_SRC="$REPO_ABS/teams/$TEAM/.claude/skills"
SKILLS_DST="$HOME/.claude/skills"

echo ""
echo "→ Claude Code 글로벌 스킬에 등록/갱신 중..."
mkdir -p "$SKILLS_DST"

LINKED=()
RELINKED=()
SKIPPED=()

if [ -d "$SKILLS_SRC" ]; then
  for skill_dir in "$SKILLS_SRC"/*/; do
    [ -d "$skill_dir" ] || continue
    skill_name="$(basename "$skill_dir")"
    target_link="$SKILLS_DST/$skill_name"

    if [ -L "$target_link" ]; then
      # 기존 링크 — 강제 갱신 (sparse-checkout 후 SKILL.md가 바뀌어도 같은 곳을 가리킴)
      ln -sfn "$skill_dir" "$target_link"
      RELINKED+=("$skill_name")
    elif [ -e "$target_link" ]; then
      # 실제 디렉토리·파일 — 사용자 자산 보호
      SKIPPED+=("$skill_name (이미 ~/.claude/skills/$skill_name 존재)")
    else
      # 신규 link
      ln -sfn "$skill_dir" "$target_link"
      LINKED+=("$skill_name")
    fi
  done
fi

echo ""
if [ "$MODE" = "install" ]; then
  echo "✓ 설치 완료"
else
  echo "✓ 업데이트 완료"
fi
echo ""
echo "  📁 팀 자산: $TARGET_DIR/teams/$TEAM/"
echo "  📁 공통 자산: $TARGET_DIR/shared/"
echo ""

if [ ${#LINKED[@]} -gt 0 ]; then
  echo "  🔗 신규 스킬 등록 (~/.claude/skills/):"
  for s in "${LINKED[@]}"; do
    echo "     • $s"
  done
fi

if [ ${#RELINKED[@]} -gt 0 ]; then
  echo "  🔄 기존 스킬 링크 갱신:"
  for s in "${RELINKED[@]}"; do
    echo "     • $s"
  done
fi

if [ ${#SKIPPED[@]} -gt 0 ]; then
  echo ""
  echo "  ⚠️  건너뜀 (충돌 방지):"
  for s in "${SKIPPED[@]}"; do
    echo "     • $s"
  done
  echo "     → 덮어쓰려면 해당 디렉토리 직접 제거 후 setup.sh 재실행"
fi

# set -u 환경에서 빈 배열 전개는 unbound variable 에러를 발생시킴
# bash 4.4+의 ${arr[@]+"${arr[@]}"} 패턴으로 빈 배열 안전하게 전개
ALL_SKILLS=(${LINKED[@]+"${LINKED[@]}"} ${RELINKED[@]+"${RELINKED[@]}"})
if [ ${#ALL_SKILLS[@]} -gt 0 ]; then
  echo ""
  echo "📍 Claude Code에서 호출 가능한 스킬:"
  for s in "${ALL_SKILLS[@]}"; do
    echo "     /$s"
  done
fi

echo ""
echo "📍 다음 업데이트:"
echo "  같은 CLI 다시 실행하면 자동 갱신됩니다"
echo "  $ curl -fsSL https://raw.githubusercontent.com/ab180/ai-camp/main/bin/setup.sh | bash -s $TEAM"
