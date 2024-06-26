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

## ZED
alias z="zed ."


# TMUX
alias tmux='env TERM=xterm-256color tmux'
alias tm='tmux'
alias tma='tmux new-session -A -s main'
alias tml='tmux list-sessions'

# Make
alias mib="NODE_OPTIONS=--max-old-space-size=18000 make i b"


# CD ALIASES
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs'
alias desky='cd ~/Desktop'

# ONWARD
alias ow='cd ~/onward/monorepo'

alias ow:pscale='ow; and pscale connect onward-db main --port 3309'
alias ow:app='cd ~/onward/monorepo; and pnpx turbo run dev --filter=app...'
alias ow:api='cd ~/onward/monorepo/services/@api/service; pnpm run dev'

alias ow:db='cd ~/onward/monorepo/packages/database'
alias ow:fern='cd ~/onward/monorepo/services/@api/fern'

# SCORCH
alias scorch='cd ~/scorch/code'
alias scorch:tauri:build='cd ~/scorch/code/tauri; and doppler run -c prd -- bunx tauri build --target aarch64-apple-darwin'



# PATH COMPLETION
set -gx PATH ~/.cargo/bin $PATH
set -gx PATH /Applications/Postgres.app/Contents/Versions/latest/bin $PATH


# ENV
set -Ux GIT_EDITOR "zed --wait"


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

## << GRAPHITE FISH COMPLETION ~ ended
