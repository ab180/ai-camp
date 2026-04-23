#!/usr/bin/env bash
# AB180 AI Camp · 팀별 sparse-checkout 세팅
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

echo ""
echo "✓ 완료: $TARGET_DIR/"
echo "  팀 자산: $TARGET_DIR/teams/$TEAM/"
echo "  공통 자산: $TARGET_DIR/shared/"
echo ""
echo "다음 단계:"
echo "  cd $TARGET_DIR/teams/$TEAM"
echo "  claude"
