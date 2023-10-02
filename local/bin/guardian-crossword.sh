#!/usr/bin/env bash

set -o pipefail
DATE=$(date +%Y%m%d)
URL="https://crosswords-static.guim.co.uk"
QUICK="gdn.quick.$DATE.pdf"
CRYPTIC="gdn.cryptic.$DATE.pdf"

# Send to Remarkable

# Quick crosswords published Mon-Sat
if [ $(date +%u) -le 6 ]; then
  p2r -p crosswords $URL/$QUICK
fi
# Cryptic crosswords published Mon-Fri
if [ $(date +%u) -le 5 ]; then
  p2r -p crosswords $URL/$CRYPTIC
fi
