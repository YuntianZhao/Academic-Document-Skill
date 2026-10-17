#!/usr/bin/env bash
set -euo pipefail

if [ "$#" -ne 1 ] || [ -z "$1" ]; then
  printf 'Usage: %s <target-directory>\n' "${0##*/}" >&2
  exit 2
fi

SCRIPT_DIR=$(CDPATH= cd -- "$(dirname -- "$0")" && pwd)
ASSET_DIR="$SCRIPT_DIR/../assets/template"
TARGET_DIR=$1
case "$TARGET_DIR" in
  -*) TARGET_DIR="./$TARGET_DIR" ;;
esac

if [ -e "$TARGET_DIR" ] && [ ! -d "$TARGET_DIR" ]; then
  printf 'ERROR: target is not a directory: %s\n' "$TARGET_DIR" >&2
  exit 1
fi

# Check the complete copy set before writing anything into the destination.
for source in document-minimal.tex document.sty references.bib .latexmkrc LICENSE.txt; do
  destination=$source
  [ "$source" != document-minimal.tex ] || destination=document.tex
  if [ ! -f "$ASSET_DIR/$source" ]; then
    printf 'ERROR: bundled template file is missing: %s\n' "$source" >&2
    exit 1
  fi
  if [ -e "$TARGET_DIR/$destination" ] || [ -L "$TARGET_DIR/$destination" ]; then
    printf 'ERROR: refusing to overwrite %s\n' "$TARGET_DIR/$destination" >&2
    exit 1
  fi
done

mkdir -p "$TARGET_DIR"
for source in document-minimal.tex document.sty references.bib .latexmkrc LICENSE.txt; do
  destination=$source
  [ "$source" != document-minimal.tex ] || destination=document.tex
  cp "$ASSET_DIR/$source" "$TARGET_DIR/$destination"
  printf 'Created %s\n' "$TARGET_DIR/$destination"
done

printf '\nEdit the sample content in %s/document.tex, then build:\n' "$TARGET_DIR"
printf '  cd %q && latexmk document.tex\n' "$TARGET_DIR"
