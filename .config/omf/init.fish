# GENERAL
alias ll='ls -la'
function cfile
    xclip -sel clip < $argv
end
function mcd
    mkdir $argv; and cd $argv
end


# SSH
alias ssha='ssh-add'
alias sshcp='xclip -sel clip < ~/.ssh/id_rsa.pub'


# NOTES
alias notes='cd ~/notes; and ll'


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
    git rebase -i HEAD~$argv
end


# VIM
alias vim="nvim"
alias v='vim'
alias vi='vim'


# TMUX
alias tmux='env TERM=xterm-256color tmux'


# WORK DIRS
alias savvy='cd ~/savvy'
alias web='cd ~/savvy/savvy-webapp'
alias api='cd ~/savvy/savvy-api'
alias wire='cd ~/wiretap'

# DOCKER
alias start-docker='sudo systemctl start docker'
alias docker-mongo='sudo docker run -d --name mongo-local -p 27017:27017 -v ~/mongo-data:/data/db mongo'
