###########################
# My Recommended Settings #
###########################

# Copy this file in your HOME directory where you have ".gitconfig"
# Then Add following lines to your .gitconfig without leading ';'
;[include]
;	path = mygitcfg.inc	# Recommended Settings.

######################################################################

# Although VIM is default fallback I'd love to assert it as my
# preffered one.
[core]
	editor = vim

# By default fetch submodules when you fetch/pull normally.
[fetch]
	recurseSubmodules = true

# Submodule update will always be recurssive
[submodule]
	recurse = true

# Typing mistakes will autocorrect and execute after this timespan.
# You can cancel <Ctrl-C> if the autocorrection is not desired one.
[help]
	autocorrect = 50	# Unit: 1/10th second. 50 == 5 Seconds

# Commit message will be pre-populated with text from this file.
[commit]
	template = ~/.gitmessage.txt
	gpgSign = true	# Use only if gpg is configured for signing.

# Always sign a tag.
[tag]
	gpgSign = true

# Reject any merge if fast-forward (ff) is not possible.
#	Use "--no-ff" option to force convensional merge.
# Merge commit must be signed.
# Use 3 way merge style to resolve conflicts.
# Merge tool is kdiff3 (Only kdiff3 and VIM support 3-way merge)
[merge]
	ff = only
	gpgSign = true
	conflictStyle = diff3
	tool = kdiff3

# Avoid unwanted merge commits during pull.
# Use "--rebase" option or uncomment next line. 
# If not sure about rebase, use --no-ff for usual merge.
[pull]
	ff = only
#	rebase = true	# Rewrites history. Use it at your own risk.
