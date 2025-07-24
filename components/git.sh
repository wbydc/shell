create_branch_and_commit() {  
  local input="$1"  
  # Extract ticket (e.g., BTA-513)  
  local ticket="${input%% *}"  
  # Remove ticket and optional [block] or similar tags, then trim spaces  
  local rest="${input#* }"  
  rest="${rest#\[*\] }"  
  rest="${rest#[[:space:]]}"  
  # For branch: lowercase, replace spaces with dashes, remove non-alphanum/dash  
  local branch="${ticket}-$(echo "$rest" | tr '[:upper:]' '[:lower:]' | sed -E 's/[^a-z0-9]+/-/g' | sed 's/^-*//;s/-*$//')"  
  # For commit: just ticket and rest, clean up spaces  
  local commit_msg="${ticket} $(echo "$rest" | sed -E 's/^[[:space:]]+//;s/[[:space:]]+$//')"  
  
  # Create branch  
  git checkout -b "$branch"  
  # Commit staged changes  
  git commit -m "$commit_msg"  
}

git-pt() {  
  create_branch_and_commit "$@"  
}
