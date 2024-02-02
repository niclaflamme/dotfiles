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
alias ow='cd ~/onward/monorepo'
alias ow:mono='cd ~/onward/monorepo'
alias ow:ui='cd ~/onward/monorepo/packages/ui'
alias ow:app='cd ~/onward/monorepo/apps/app'
alias ow:api='cd ~/onward/monorepo/apps/app'

alias ow:bg:pscale='ow:mono; and pscale connect onward-db --port 3309'
alias ow:bg:temporal='ow:mono; and temporal server start-dev'
alias ow:bg:hookdeck='ow:mono; and hookdeck listen 8910'

alias ow:dev:api='ow:mono; and npx turbo run dev --filter=api...'
alias ow:dev:app='ow:mono; and npx turbo run dev --filter=app...'
alias ow:dev:temporal='ow:mono; and npx turbo run dev --filter=temporal...'


# PATH COMPLETION
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH



## >> GRAPHITE FISH COMPLETION ~ start

# git helpers adapted from fish git completion
function __fish_git_local_branches
    command git for-each-ref --format='%(refname:strip=2)' refs/heads/ 2>/dev/null
end

function __fish_git_remote_branches
    command git for-each-ref --format="%(refname:strip=3)" refs/remotes/ 2>/dev/null
end

# graphite helpers
function __gt_command_completions
    set -lx SHELL (type -p fish)
    set -l command (commandline -opc)
    # uncomment to include options, e.g. -q, --help
    # $command --get-yargs-completions
    # uncomment to exclude options (default)
    $command --get-yargs-completions | string replace -r '\-.*' ''
end

# disable file completions for the entire command
complete -c gt -f

# add completions as provided by CLI
complete -c gt -a "(__gt_command_completions)"

# commands that take branches
complete -c gt -x -n "__fish_seen_subcommand_from checkout co bco delete dl rename rn onto --onto -o tr utr track untrack" -a "(__fish_git_local_branches)"

# gt downstack get takes remote branches
complete -c gt -x -n "__fish_seen_subcommand_from ds dsg get g" -n "__fish_seen_subcommand_from get dsg" -a "(__fish_git_remote_branches)"

## << GRAPHITE FISH COMPLETION ~ end
