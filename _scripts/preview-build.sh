#!/usr/bin/env bash
# Netlify deploy-preview / branch-deploy build: fast and self-contained, using
# the minimal sample database instead of the full 375MB funds.db (which CI
# downloads for production). Invoked from netlify.toml.
set -euo pipefail

# Record build metadata surfaced on /metrics as mfapi_build_info.
printf 'data_release: "sample"\ncommit: "%s"\n' "${COMMIT_REF:-unknown}" > _data/build.yml

# Build a minimal funds.db from the committed SQL fixture (start from a clean
# file so the fixture's CREATE TABLE statements don't collide with a stale db).
rm -f funds.db
sqlite3 funds.db < _scripts/sample.sql

bundle exec jekyll build

# Fail loudly if the endpoint came out empty or malformed.
test -s _site/metrics
ruby _scripts/validate-metrics.rb _site/metrics
