#!/bin/bash

IFS='|'
str="'$*'"
curl --request GET \
  --silent \
  --url "https://api.kuvera.in/mf/api/v4/fund_schemes/$str.json" \
  --header 'Content-Type: application/json' | \
  jq -r '.[] | [.ISIN,.code]|@csv' >> lookup.csv