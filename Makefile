amfi:
	curl --retry 10 \
	--connect-timeout 30 \
	--retry-max-time 100 \
	--silent "https://www.amfiindia.com/spages/NAVAll.txt" | \
	grep ';' > "_data/nav.csv";

all: amfi