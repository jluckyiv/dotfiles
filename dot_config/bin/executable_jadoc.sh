SESSION_ID=$1
REFNO=$2
FILE_ID=$3
FILENAME=$4

# check if any of the arguments are empty
if [ -z "$SESSION_ID" ]; then
	echo "Usage: $0 <session_id> <refno> <file_id> <filename>"
	exit 1
fi

echo "https://access.jamsadr.com/api/jamsaccess/document/document-display?fileId=$FILE_ID&download=true&isCaseDocument=true&binary=true"
echo "cookie: ASP.NET_SessionId=$SESSION_ID; AWSELB=5171550914C7911E14F92535D9C1CA744127E7EC7E9D397B2B4F208EE40C6F00811F8FB98F2E4F6CB6AD0AF6F9F424AB228C73EC88EBEA305DF1BE2E82D49C04613F5DC115; AWSELBCORS=5171550914C7911E14F92535D9C1CA744127E7EC7E9D397B2B4F208EE40C6F00811F8FB98F2E4F6CB6AD0AF6F9F424AB228C73EC88EBEA305DF1BE2E82D49C04613F5DC115;"
echo "referer: https://access.jamsadr.com/cases/detail?caseId=$REFNO"
echo "$FILENAME"

curl "https://access.jamsadr.com/api/jamsaccess/document/document-display?fileId=$FILE_ID&download=true&isCaseDocument=true&binary=true" \
	-H "accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7" \
	-H "accept-language: en-US,en;q=0.9" \
	-H "cookie: AWSELB=5171550914C7911E14F92535D9C1CA744127E7EC7E9D397B2B4F208EE40C6F00811F8FB98F2E4F6CB6AD0AF6F9F424AB228C73EC88EBEA305DF1BE2E82D49C04613F5DC115; AWSELBCORS=5171550914C7911E14F92535D9C1CA744127E7EC7E9D397B2B4F208EE40C6F00811F8FB98F2E4F6CB6AD0AF6F9F424AB228C73EC88EBEA305DF1BE2E82D49C04613F5DC115;  ASP.NET_SessionId=$SESSION_ID;" \
	-H "dnt: 1" \
	-H "referer: https://access.jamsadr.com/cases/detail?caseId=$REFNO" \
	-H "sec-ch-ua: \"Chromium\";v=\"123\", \"Not:A-Brand\";v=\"8\"" \
	-H "sec-ch-ua-mobile: ?0" \
	-H "sec-ch-ua-platform: \"macOS\"" \
	-H "sec-fetch-dest: iframe" \
	-H "sec-fetch-mode: navigate" \
	-H "sec-fetch-site: same-origin" \
	-H "upgrade-insecure-requests: 1" \
	-H "user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/123.0.0.0 Safari/537.36" \
	--output "$FILENAME"
