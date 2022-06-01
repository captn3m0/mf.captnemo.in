mf-list:
	curl --retry 10 \
    --connect-timeout 30 \
    --retry-max-time 100 \
    --silent https://api.kuvera.in/mf/api/v4/fund_schemes/list.json | \
	jq -r '.[] | .[] | .[] | .[] | .c' | sort -u | xargs -n150 _scripts/fetch.sh
	sort -uo lookup.csv lookup.csv
	cat _scripts/header.csv lookup.csv > _data/lookup.csv
	rm lookup.csv