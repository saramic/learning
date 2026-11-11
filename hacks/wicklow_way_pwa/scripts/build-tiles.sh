#!/usr/bin/env bash
# Cut an offline vector basemap for Wicklow Way stages 1-4 out of the
# Protomaps daily planet build (OpenStreetMap data, ODbL).
#
#   scripts/build-tiles.sh            # uses yesterday's build
#   BUILD=20261110 scripts/build-tiles.sh
set -euo pipefail
cd "$(dirname "$0")/.."

PMTILES_VERSION=1.31.2
BIN=.cache/bin/pmtiles
# stages 1-4 span lon -6.38..-6.20, lat 52.95..53.27; pad ~8 km for exploring
BBOX=-6.50,52.90,-6.08,53.32
BUILD=${BUILD:-$(date -v-1d +%Y%m%d 2>/dev/null || date -d yesterday +%Y%m%d)}
OUT=public/data/wicklow.pmtiles

if [[ ! -x $BIN ]]; then
  arch=$(uname -m); [[ $arch == aarch64 ]] && arch=arm64
  zip="go-pmtiles-${PMTILES_VERSION}_$(uname -s)_${arch}.zip"
  mkdir -p .cache/bin
  curl -sL -o ".cache/bin/$zip" \
    "https://github.com/protomaps/go-pmtiles/releases/download/v${PMTILES_VERSION}/$zip"
  unzip -o -q ".cache/bin/$zip" -d .cache/bin
fi

$BIN extract "https://build.protomaps.com/${BUILD}.pmtiles" "$OUT" \
  --bbox="$BBOX" --maxzoom=15
$BIN show "$OUT" | head -20
ls -lh "$OUT"
