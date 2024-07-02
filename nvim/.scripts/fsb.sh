#!bin/bash

# Fuzzy Search Git bransh in a repo
# Looks for local and remotes branches
function fsb() {
  local pattern=$*
    local branches branch
    branches=$(git branch --all | awk 'tolower($0) ~ /'"$pattern"'/') &&
    branch=$(echo "$branches" | 
    )
}
