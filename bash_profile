export CLICOLOR=1

# Set up PS1
function parse_git_branch() {
    git branch 2>/dev/null | grep '^*' | colrm 1 2
}

IWhite="\[\033[0;97m\]"
Host="\h"
Color_Off="\[\033[0m\]"
PathShort="\w"
IRed="\[\033[0;91m\]"
Turquoise="\[\033[38;5;6m\]"
export LSCOLORS=gxBxhxDxfxhxhxhxhxcxcx
export PS1=$IWhite$Host": "$Turquoise"["$PathShort"] "$IRed"\$(parse_git_branch) "$Color_Off"\$ "

[ -f ~/.fzf.bash ] && . ~/.fzf.bash
