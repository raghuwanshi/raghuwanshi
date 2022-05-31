##################
## Aliases      ##
##################
# Instead of -l putting -g will hide user name because group info is not there on windows.
alias ll='ls -g -A -h'

alias gt='git log --oneline --decorate --graph --exclude=refs/stash'
alias gta='gt --all'
alias gt10='gt -10'
#alias gl='git log --format="%C(auto)%h%x09%s"'
# Above should use TAB as seperator but terminals replace that with spaces.
alias gl='git log --format="%C(auto)%h: %s"'
alias gl10='gl -10'
alias glog='git log --stat --show-signature'
alias glog1='glog -1'

alias gs='git status --short --branch'
alias gst='git status --column=always --show-stash'

alias gau='git add --update'
alias gc='git commit --gpg-sign'
alias gpre='git pull --rebase --gpg-sign'
alias gclone='git clone --recurse-submodules'
alias smu='git submodule update --init --recursive'
alias gpush='git push --follow-tags --recurse-submodules=on-demand'

alias gmvbranch='git branch --force' # <branch name> <commit to move to>
alias ignore-ls='git ls-files -v | grep '^[[:lower:]]' | cut -d" " -f2'
alias ignore-set='git update-index --assume-unchanged'
alias ignore-not='git update-index --no-assume-unchanged'

##################
## Git Flags    ##
##################
export set GIT_PS1_SHOWCOLORHINTS="true"
export set GIT_PS1_SHOWUNTRACKEDFILES="true"
export set GIT_PS1_SHOWDIRTYSTATE="true"
export set GIT_PS1_DESCRIBE_STYLE="branch"
export set GIT_PS1_STATESEPARATOR=""
export set GIT_PS1_SHOWUPSTREAM="verbose name"

##################
## Git Prompt   ##
##################
# Following escape sequences are referenced from:
# https://en.wikipedia.org/wiki/ANSI_escape_code#3-bit_and_4-bit
# Use "Cascadia Mono PL" font.
PS1='\[\e[1000C\e[23D\]'		# Move cursor 1000 right (edge of the window) and 21 back.
PS1="$PS1"'\[\e[35m\]'			# Megenta foreground incline.
PS1="$PS1"'\[\e[1;32;45m\]'		# Bright green foreground with megenta background.
PS1="$PS1"'\D{%I:%M:%S %p}'		# Time in hh:mm:ss AM/PM format.
PS1="$PS1"'\[\e[22;33m\]'		# Normal yellow foreground incline.
PS1="$PS1"'\[\e[30;43m\]\d'		# Black foreground with yellow background date and boundary glyph.
PS1="$PS1"'\[\e[0m\]\r\n'		# Reset colours, cursor return and new line.
PS1="$PS1"'\[\e]0;Git Bash\a\]'		# Some apps like npm, change the title. (note ] instead of [)
PS1="$PS1"'\[\e[22;31;40m\]'		# Normal black foreground incline.
PS1="$PS1"'\[\e[33;40m\]'		# Red foreground black background and boundary glyph..
PS1="$PS1"'\[\e[33m\]Ashutosh@\h'	# Name @ Host
PS1="$PS1"'\[\e[30;45m\]'		# Black (arrow) with megenta background for next arrow.
PS1="$PS1"'`__git_ps1 "'		# If current folder is Git repo.
	PS1="$PS1"'\[\e[46m\]'		# Black (arrow) with cyan background.
	PS1="$PS1"''			# Arrow from the right side of the name.
	PS1="$PS1"'\[\e[1;37m\]'	# Bright white forground.
	PS1="$PS1"''			# Branch symbol.
	PS1="$PS1"'\[\e[22;30m\]'	# Normal black foreground.
	PS1="$PS1"'%s'			# Git branch status.
	PS1="$PS1"'\[\e[45;36m\]'	# Cyan forground with megenta background for next arrow.
	PS1="$PS1"'"`'			# Git Repo info finished.
PS1="$PS1"''				# Depending on git repo or not this can be first or second arrow.
PS1="$PS1"'\[\e[1;33;45m\]'		# Bright yellow foreground with megenta background.
PS1="$PS1"'\w'				# Working directory.
PS1="$PS1"'\[\e[0m\]'			# Reset everything to default (specially background before new line)
PS1="$PS1"'\[\e[35m\]'			# Megenta foreground for last arrow.
PS1="$PS1"'\n'				# Arrow followed by new line.
PS1="$PS1"'\[\e[1;31m\]'		# Bright red foreground left fire.
PS1="$PS1"'\[\e[33;41m\]'		# Bright yellow foreground with red background.
PS1="$PS1"'$(if [ $SHLVL -gt 1 ]; then echo "BASH$SHLVL>"; fi)\#'				# Fire for commands.
PS1="$PS1"'\[\e[0;1;31m\]'		# Default background with bright red foreground right fire.
PS1="$PS1"'\[\e[22;33m\]'		# Normal yellow foreground.
PS1="$PS1"'\$ '				# Dollar/Hash Prompt.
PS1="$PS1"'\[\e[0m\]'			# Reset everything (styles) to default.

export set PS1				# Export the prompt for sub-shells
export set PS2='\[\e[22;33m\]'"$PS2"'\[\e[0m\]' # Let's make secondary prompt yellow for better visibility.


# Fonts not compatible for weathers
#curl wttr.in?format="%l\nSunset:+%s,+Moon:+%m%M\nWeather:+%c%t+(Feels+like:%f)"