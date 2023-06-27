#!/bin/sh

# Checkout to the target branch, and apply this patch by running:
#     git show patch:patch.sh | sh

set -e

git show patch:pythonic.patch | git apply
git add .
git commit -m "feat: add pythonic formatter"

# So that it works on both Linux on macOS
find . -name '*.rs' -exec sed -i"-sed-backup" 's/serde_json/serde_json_pythonic/g' {} \;
find . -name 'Cargo.toml' -exec sed -i"-sed-backup" 's/serde_json/serde_json_pythonic/g' {} \;
find . -name '*-sed-backup' -exec rm {} \;

cargo fmt --all
git add .
git commit -m "chore: rename crate to serde_json_pythonic"
