# GENERAL
alias ll='ls -la'


# SSH
alias ssha='ssh-add'
alias sshcp='xclip -sel clip < ~/.ssh/id_rsa.pub'


# DOTFILES
alias dot='cd ~/dotfiles'
alias dotgit='git --git-dir ~/.dotfiles/.git --work-tree=$HOME'
alias dotsync='dotgit reset --hard'


# GIT
alias gl='git log --pretty=format:"%h - %an, %ar : %s" --graph'
alias gs='git status'
alias gp='git pull'
alias gitwip='git add .; and git commit -m "wip" -n'
alias gti='git'
alias ggit='git'
# GIT (FUNCTIONS)
function gitsquash
      git rebase -i HEAD~($argv)
end


# VIM
alias v='vim'
alias vi='vim'


# UNITO
alias unito='cd ~/unito/code'
alias conn='unito; and cd connectors'
alias cons='unito; and cd console'
alias ucomm='unito; and cd ucommon'
alias sw='unito; and cd sync-worker'
alias unitosymlinks='unito; and ./internal-tools/dev/local_libs.sh'
alias unitotime='unito; and cd ../timesheets; and ll'


# SOUND
alias sound:off='amixer -D pulse sset Master 0%'
alias sound:low='amixer -D pulse sset Master 25%'
alias sound:half='amixer -D pulse sset Master 50%'
alias sound:full='amixer -D pulse sset Master 100%'
alias sound:toggle='amixer -D pulse set Master 1+ toggle'
