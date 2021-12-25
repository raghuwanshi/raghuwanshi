#!/usr/bin/env bash

# Coppies any files from target folder to this folder (repository).
# But only if they are already present in the repository.

targetFolder=$HOME

if [ -d "$1" ]; then
	targetFolder=$1
fi

for f in $(ls -A); do
	if [ -f $f ]; then # Not a folder
		if [ -f $targetFolder/$f ]; then # File is present in target folder.
			cp $targetFolder/$f ./$f
			echo "Coppied $targetFolder/$f"
		fi
	fi
done

# Update the repository. Commit can be done manually after making
# sure that everything is alright.
git add --update