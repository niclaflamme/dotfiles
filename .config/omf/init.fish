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
alias tm='tmux'
alias tma='tmux attach'
alias tml='tmux list-sessions'


# ORIGAMI
alias api='cd ~/origami/code/api'
alias boom='cd ~/origami/code/boomerang'
alias boombox='cd ~/origami/code/boombox'
alias pocket='cd ~/origami/code/pocket'
alias wizzy='cd ~/origami/code/wizard'
alias gamifire='cd ~/origami/code/firebase'

alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/code'
alias traba='icloud; and cd ./traba'
alias gami='icloud; and cd ./origami'

# SHORTCUTS
alias desky='cd ~/Desktop'


# YARN
alias ysd='yarn start:dev'
alias ys='yarn start'
alias yi='yarn install'



set -gx PATH ~/.cargo/bin $PATH
