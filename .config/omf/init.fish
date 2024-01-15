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


# DOTFILES
alias dot='cd ~/dotfiles'
alias dotv='cd ~/dotfiles; and v'
alias dov='cd ~/dotfiles; and v'
alias dotnvim='cd ~/.config/nvim; and v'


# GIT
alias gl='git log --pretty=format:"%h - %an, %ar : %s" --graph'
alias gs='git status'
alias gp='git pull'
alias gitwip='git add .; and git commit -m "wip" -n'
alias gityolo='git add .; and git commit -m "yolo" -n'
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
alias tma='tmux new-session -A -s main'
alias tml='tmux list-sessions'


# CD ALIASES
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias desky='cd ~/Desktop'

alias strangers='cd ~/strangers/code'
alias sapi='cd ~/strangers/code/api'
alias sios='cd ~/strangers/code/strangers'

# BUN ALIASES
alias brsd='bun run start:dev'

# ONWARD
alias ow:mono='cd ~/onward/monorepo'

alias ow:pscale='ow:mono; and pscale connect onward-db --port 3309'
alias ow:temporal='ow:mono; and temporal server start-dev'
alias ow:hookdeck='ow:mono; and hookdeck listen 8910'
alias ow:dev='ow:mono; and yarn dev:app'


# PATH COMPLETION
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH
