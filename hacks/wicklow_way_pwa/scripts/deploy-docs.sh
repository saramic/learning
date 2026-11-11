#!/usr/bin/env bash
# Copy the built app into the repo's GitHub Pages folder (docs/ on master).
# It is then served at https://saramic.github.io/learning/wicklow/ once committed
# and pushed. Bump VERSION in public/sw.js first if the shell files changed.
set -euo pipefail
cd "$(dirname "$0")/.."
DEST=../../docs/wicklow
mkdir -p "$DEST"
rsync -a --delete public/ "$DEST/"
echo "Copied public/ → $DEST ($(du -sh "$DEST" | cut -f1))"
echo "Next: git add docs/wicklow && git commit && git push"
