export ZSH="$HOME/.oh-my-zsh"

alias work="cd $HOME/workspace"
alias n="nvim"
alias t='todo.sh -d ~/todo.cfg'
alias pn="pnpm"
alias nukey="rm -rf node_modules && yarn"
alias nukeb="rm -rf node_modules && bun install"

. "$HOME/.cargo/env"

export HOMEBREW_AUTO_UPDATE_SECS=86400
