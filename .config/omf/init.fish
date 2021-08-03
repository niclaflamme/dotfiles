# GENERAL
alias ll='ls -la'
function toclipboard
    xclip -sel clip < $argv
end
function mcd
    mkdir $argv; and cd $argv
end


# SSH
alias ssha='ssh-add'
alias sshcopy='xclip -sel clip < ~/.ssh/id_rsa.pub'


# NOTES
alias notes='cd ~/notes; and ll'


# DOTFILES
alias dot='cd ~/dotfiles'
alias dotv='dot; and v'
alias dov='dot; and v'


# GIT
alias gl='git log --pretty=format:"%h - %an, %ar : %s" --graph'
alias gs='git status'
alias gp='git pull'
alias gitwip='git add .; and git commit -m "wip" -n'
alias gti='git'
alias ggit='git'
# GIT (FUNCTIONS)
function gitsquash
    git reset --soft HEAD~$argv
end


# VIM
alias vim="nvim"
alias v='vim'


# TMUX
alias tmux='env TERM=xterm-256color tmux'


alias hf='cd ~/hostagefund'

alias hfapi='cd ~/hostagefund/api'
alias hfclient='cd ~/hostagefund/client'
alias hffire='cd ~/hostagefund/firebase'

alias cadoo='cd ~/cadoo'
alias capi='cd ~/cadoo/api'


# G-utils
if [ -f '/Users/niclaflamme/Desktop/google-cloud-sdk/path.fish.inc' ]; . '/Users/niclaflamme/Desktop/google-cloud-sdk/path.fish.inc'; end
