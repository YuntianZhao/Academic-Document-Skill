#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
CREATE="$ROOT_DIR/academic-document/scripts/create-document.sh"
WORK=$(mktemp -d "${TMPDIR:-/tmp}/academic-document-test.XXXXXX")
trap 'rm -rf -- "$WORK"' EXIT

fail() {
  printf 'FAIL: %s\n' "$1" >&2
  exit 1
}

expect_refusal() {
  if bash "$CREATE" "$1" >"$WORK/creation.log" 2>&1; then
    fail 'setup accepted a destination containing a template file'
  fi
}

# A late collision must leave both user configuration and the directory intact.
mkdir "$WORK/existing project"
printf 'User-owned latexmk configuration\n' >"$WORK/expected"
cp "$WORK/expected" "$WORK/existing project/.latexmkrc"
expect_refusal "$WORK/existing project"
cmp -s "$WORK/expected" "$WORK/existing project/.latexmkrc" ||
  fail 'setup changed existing configuration'
for file in document.tex document.sty references.bib LICENSE.txt; do
  if [ -e "$WORK/existing project/$file" ] || [ -L "$WORK/existing project/$file" ]; then
    fail 'setup partially populated a conflicting destination'
  fi
done

# A dangling symlink is still user-owned and must not be followed or replaced.
mkdir "$WORK/linked project"
ln -s ../missing.bib "$WORK/linked project/references.bib"
expect_refusal "$WORK/linked project"
[ -L "$WORK/linked project/references.bib" ] || fail 'setup replaced a symlink'
[ "$(readlink "$WORK/linked project/references.bib")" = ../missing.bib ] ||
  fail 'setup changed a symlink target'
[ ! -e "$WORK/missing.bib" ] || fail 'setup wrote through a dangling symlink'
for file in document.tex document.sty .latexmkrc LICENSE.txt; do
  if [ -e "$WORK/linked project/$file" ] || [ -L "$WORK/linked project/$file" ]; then
    fail 'setup partially populated a symlink-conflicting destination'
  fi
done

printf 'PASS: existing configuration and dangling symlinks remain untouched\n'
