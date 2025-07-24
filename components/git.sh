git_push_task() {  
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
  # Push branch to remote  
  git push -u origin "$branch"
}

alias gpt='git_push_task'

git_pull_all() {  
  find . -type d -name ".git" | while read -r gitdir; do  
    repo_dir="$(dirname "$gitdir")"  
    echo "Pulling in $repo_dir"  
    (cd "$repo_dir" && git pull)  
  done  
}

alias gpa='git_pull_all'


git_rebase_main() {  
  local default_branch  
  default_branch=$(git remote show origin | awk '/HEAD branch/ {print $NF}')  
  git fetch origin "$default_branch"  
  git rebase "origin/$default_branch"  
}

alias grm='git_rebase_main'
