#!/bin/bash

# Create a new orphan branch with the current state of the repository
git checkout --orphan latest_branch
git add -A
git commit -am "rebase"

# Delete the old master branch
git branch -D master

# Rename the new branch to master
git branch -m master

# Clear the reflog to remove references to old commits
git reflog expire --expire=now --all

# Run garbage collection to permanently remove the unreferenced commits
git gc --prune=now

# Force push the changes to the remote repository
git push -f origin master

