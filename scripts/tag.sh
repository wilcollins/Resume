#!/bin/bash

# Check if a tag name was provided
if [ -z "$1" ]; then
    echo "Error: No tag name provided."
    echo "Usage: $0 <tag-name>"
    exit 1
fi

# Define the tag name
TAG_NAME="$1"

# Check if the tag already exists
if git rev-parse "$TAG_NAME" >/dev/null 2>&1; then
    # Prompt the user for confirmation to overwrite the tag
    read -p "Tag '$TAG_NAME' already exists. Overwrite? (y/N) " response
    if [[ "$response" =~ ^[Yy]$ ]]; then
        # Delete the existing tag locally and remotely
        git tag -d "$TAG_NAME"
        git push --delete origin "$TAG_NAME"
    else
        echo "Tag creation aborted."
        exit 0
    fi
fi

# Create the Git tag
git tag "$TAG_NAME"

# Check if the tag creation was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to create the tag."
    exit 1
fi

# Push the tag to the remote repository
git push origin "$TAG_NAME"

# Check if the push was successful
if [ $? -ne 0 ]; then
    echo "Error: Failed to push the tag to the remote repository."
    exit 1
fi

echo "Tag '$TAG_NAME' created and pushed successfully."

