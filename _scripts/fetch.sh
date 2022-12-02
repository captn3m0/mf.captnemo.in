#!/bin/bash

IFS='|'

fetch(){
  c="$#"
  f=$(mktemp -u --suffix=.json)
  curl --request GET --fail \
    --silent \
    --url "https://api.kuvera.in/mf/api/v5/fund_schemes/$*.json" \
    --header 'Content-Type: application/json' --output $f
  if [ $? -ne 0 ]; then
    if [ $c -ne 1 ]; then
      half=$((c/2))
      left=("${*:1:$half}")
      right=("${*:$half+1}")
      # Invoke an explicit subshell for recursion
      (fetch $left )
      (fetch $right )
    else
      echo "[FAIL] $*"
    fi
  else
    cat "$f" | jq -r '.[] | [.ISIN,.code]|@csv' >> lookup.csv
  fi  
}

fetch $*
