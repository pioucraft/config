gh api -H "Accept: application/vnd.github+json" -H "X-GitHub-Api-Version: 2022-11-28" /user/repos?per_page=100 | jq -r '.[].full_name' | while read -r repo_full_name; do   owner=$(echo "$repo_full_name" | cut -d/ -f1);   repo_name=$(echo "$repo_full_name" | cut -d/ -f2)
  mkdir -p "$owner"
  git clone "https://github.com/$repo_full_name.git" "$owner/$repo_name.git"; done
