#!/bin/sh
TOKEN="your_personal_access_token" # Personal access token: https://github.com/settings/tokens
USERNAME="your_github_username" # Your Github username
GITHUB_PAGE="https://api.github.com/search/repositories?q=user:$USERNAME"
OUTPUT_DIR="path/to/output/directory" # No "/" at the end

# Get the names and default branches of your repositories
NAMES=($(curl -u $USERNAME:$TOKEN $GITHUB_PAGE | python3 -c "import sys, json; print(' '.join([item.get('name') for item in json.load(sys.stdin)['items']]));"))
BRANCHES=($(curl -u $USERNAME:$TOKEN $GITHUB_PAGE | python3 -c "import sys, json; print(' '.join([item.get('default_branch') for item in json.load(sys.stdin)['items']]));"))

# Download all repositories in zip-format to the current directory
for ((i = 0; i < ${#NAMES[@]}; ++i))
do
	echo ${NAMES[$i]}
	curl -Lu $USERNAME:$TOKEN "https://github.com/$USERNAME/${NAMES[$i]}/zipball/${BRANCHES[$i]}" > "$OUTPUT_DIR/${NAMES[$i]}.zip"
done
