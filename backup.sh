#!/usr/bin/env bash

# Coppies any files from target folder to this folder (repository).
# But only if they are already present in the repository.

srcFolder=$HOME
dstFolder=profile
restore=""

if [ "restore" = "$1" ]; then
	restore=true
	shift
fi

if [ -d "$1" ]; then
	srcFolder=$1
elif [ "" != "$1" ]; then
	echo Incorrect Path: $1
	exit 1
fi

if [ $restore ]; then
	echo Restoring to $srcFolder
	cp -r $dstFolder/. $srcFolder/
else
	for f in $(ls -A $dstFolder); do # List files under profile folder.
		if [ -f $dstFolder/$f ]; then # Not a folder. Subfolders will not be backed up.
			if [ -f $srcFolder/$f ]; then # File is present in target folder.
				cp $srcFolder/$f $dstFolder/$f
				echo "Coppied $srcFolder/$f"
			fi
		fi
	done
fi
git diff
# Update the repository. Commit can be done manually after making
# sure that everything is alright.
git add --update

