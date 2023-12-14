#!/bin/bash

echo "Enter repo names with comma to ignore: (helloworld, helloahmet)"
read repoNames

# Set IFS to comma to split the input string
IFS=', ' read -ra repoArray <<< "$repoNames"

output="ignoreRepoList = ["

# Print each repository name
for index in "${!repoArray[@]}"; do
    repo="${repoArray[index]}"

    echo "Ignored repository: $repo"

    if [ $index -eq 0 ]; then
        output+=" '$repo' "
    else
        output+=",'$repo' "
    fi
done

output+="]"

echo $output > ./src/module/ignore.py

echo "Ignore file is saved successfully."