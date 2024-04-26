#!/usr/bin/env bash

# Retrieve repository information
repo_url=$(git config --get remote.origin.url)
repo_name=$(basename -s .git "$repo_url" | tr '-' '_' | tr '[:upper:]' '[:lower:]')
repo_owner=$(echo "$repo_url" | awk -F ':' '{print $2}' | awk -F '/' '{print $1}')

echo "Repo name: ${repo_name}"
echo "Repo owner: ${repo_owner}"

# Check if a specific renaming script exists
if [ -f ".github/workflows/rename_project.yml" ]; then
    .github/rename_project.sh -a "${repo_owner}" -n "${repo_name}" -d "Awesome ${repo_name} created by ${repo_owner}"
fi

echo "Done! Review, commit, and push the changes."
