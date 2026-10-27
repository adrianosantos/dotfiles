#!/usr/bin/env bash
# demo-setup.sh - what the README demo (demo.tape) needs before vhs runs, on a Mac:
# a real `up`, captured with a pseudo-terminal into /tmp/dotfiles-demo-up.replay and
# cleaned of the terminal queries and progress codes some tools send. The recording's
# `up` replays that file rather than running `up` itself: VHS's terminal stopped
# drawing partway through a long `up`, twice (2026-10-27). Run it right after an `up`
# that left nothing to upgrade, so this one only checks; a password prompt would
# end it. Then, from the repo root: vhs .github/demo.tape, and gifsicle as it says.
set -euo pipefail
raw=/tmp/dotfiles-demo-up.txt
out=/tmp/dotfiles-demo-up.replay

MISE_RAW=1 script -q "$raw" zsh -ic 'stty cols 88 rows 26 2>/dev/null; up' </dev/null >/dev/null

python3 - "$raw" "$out" <<'EOF'
import re, sys
t = open(sys.argv[1], 'rb').read().decode('utf-8', 'replace').replace('\r', '')
t = re.sub(r'\x1b\][^\x07\x1b]*(?:\x07|\x1b\\)', '', t)  # OSC: colour queries, progress
t = re.sub(r'\x1b\[[0-9;?]*[A-Za-ln-z]', '', t)            # CSI other than colours
t = t.replace('\x04', '').replace('\x08', '')
t = re.sub(r'^\^D', '', t)                                   # the pty's echo of end of input
open(sys.argv[2], 'w').write(t.rstrip('\n') + '\n')
EOF

echo "captured $(wc -l < "$out" | tr -d ' ') lines of up into $out; now: vhs .github/demo.tape"
echo "then: gifsicle -O3 --lossy=30 --colors 64 -b .github/demo.gif"
