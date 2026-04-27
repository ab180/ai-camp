#!/usr/bin/env bash
# AB180 AI Camp · 팀별 sparse-checkout + 글로벌 스킬 설치
# Usage: curl -fsSL https://raw.githubusercontent.com/ab180/ai-camp/main/bin/setup.sh | bash -s <team>
#    예: bash -s csm

set -euo pipefail

TEAM="${1:-}"
if [ -z "$TEAM" ]; then
  echo "사용법: setup.sh <team>"
  echo "예: setup.sh csm"
  exit 1
fi

TARGET_DIR="ai-camp-${TEAM}"

if [ -d "$TARGET_DIR" ]; then
  echo "⚠️  $TARGET_DIR 이(가) 이미 존재합니다. 삭제하거나 다른 위치에서 실행해주세요."
  exit 1
fi

echo "→ $TEAM 팀 폴더만 받아오는 중..."
git clone --no-checkout --filter=blob:none https://github.com/ab180/ai-camp "$TARGET_DIR"
cd "$TARGET_DIR"
git sparse-checkout init --cone
git sparse-checkout set "teams/$TEAM" "shared" "archive"
git checkout

REPO_ABS="$(pwd)"
SKILLS_SRC="$REPO_ABS/teams/$TEAM/.claude/skills"
SKILLS_DST="$HOME/.claude/skills"

echo ""
echo "→ Claude Code 글로벌 스킬에 등록 중..."
mkdir -p "$SKILLS_DST"

LINKED=()
SKIPPED=()

if [ -d "$SKILLS_SRC" ]; then
  for skill_dir in "$SKILLS_SRC"/*/; do
    [ -d "$skill_dir" ] || continue
    skill_name="$(basename "$skill_dir")"
    target_link="$SKILLS_DST/$skill_name"

    if [ -e "$target_link" ] && [ ! -L "$target_link" ]; then
      # 실제 디렉토리·파일이 있으면 덮어쓰지 않음
      SKIPPED+=("$skill_name (이미 ~/.claude/skills/$skill_name 존재)")
      continue
    fi

    ln -sfn "$skill_dir" "$target_link"
    LINKED+=("$skill_name")
  done
fi

echo ""
echo "✓ 완료"
echo ""
echo "  📁 팀 자산: $TARGET_DIR/teams/$TEAM/"
echo "  📁 공통 자산: $TARGET_DIR/shared/"
echo ""

if [ ${#LINKED[@]} -gt 0 ]; then
  echo "  🔗 글로벌 스킬 등록 (~/.claude/skills/):"
  for s in "${LINKED[@]}"; do
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

echo ""
echo "📍 사용 시작:"
echo "  어느 폴더에서나 → claude 실행 → 아래 스킬 호출"
echo ""

if [ ${#LINKED[@]} -gt 0 ]; then
  for s in "${LINKED[@]}"; do
    echo "     /$s"
  done
fi

echo ""
echo "📍 업데이트:"
echo "  cd $TARGET_DIR && git pull"
echo "  → 심볼릭 링크라 자동으로 최신 상태 반영"
