# Listing directory shortcuts
alias ls='ls -hF --color=tty'                   # classify files in color
alias dir='ls -lh --color=auto'

alias l="ls -lF"                                # List all files colorized in long format
alias la="ls -laF"                              # List all files colorized in long format, including dotfiles
alias lsd="ls -lF | grep --color=never '^d'"    # List only directories

# Navigation shortcuts
alias ..="cd .."
alias ...="cd ../.."
alias ~="cd ~"
alias -- -="cd -"

# File manipulation shortcuts
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias mkdir='mkdir -p'                          # Create parent directories as needed

# git commands
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gco='git checkout'
alias gd='git diff --color-words'
alias gdc='git diff --cached --color-words'
alias gf='git fetch'
alias gl='git log --oneline --graph --decorate --all'
alias gp='git push'
alias gs='git status'

# System shortcuts
alias h='history'                               # show command history
alias j='jobs -l'                               # list active jobs
alias df='df -h'                                # human-readable disk usage
alias du='du -h --max-depth=1'                  # human-readable disk usage of current directory
alias free='free -h'                            # human-readable memory usage
alias top='htop'                                # better interactive process viewer
alias ip='dig +short myip.opendns.com @resolver1.opendns.com'  # get public IP address
alias path='echo -e ${PATH//:/\\n}'             # display each PATH entry on a new line
alias port='netstat -tulanp'                    # list open ports and associated programs

# Custom functions
# psg: search for processes matching a pattern (case insensitive)
psg() {
    if [ -z "$1" ]; then
        echo "Usage: psg <pattern>"
        return 1
    fi
    ps aux | grep -i -e VSZ -e "$1" --color=auto | grep -v grep
}

# Use Git’s colored diff when available
hash git &>/dev/null;
if [ $? -eq 0 ]; then
	function diff() {
		git diff --no-index --color-words "$@";
	}
fi;

# Determine size of a file or total size of a directory
function fs() {
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh;
	else
		local arg=-sh;
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@";
	else
		du $arg .[^.]* ./*;
	fi;
}