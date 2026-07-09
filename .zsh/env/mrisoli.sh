export ZSH="$HOME/.oh-my-zsh"
export PNPM_HOME="$HOME/.pnpm"

alias work="cd $HOME/workspace"
alias n="nvim"
alias t='todo.sh -d ~/todo.cfg'
alias pn="pnpm"
alias nuke="rm -rf node_modules && npm i"
alias gbclean="git branch | grep -v main | xargs git branch -D"
alias create-app="$HOME/.zsh/env/create-app"
export HOMEBREW_AUTO_UPDATE_SECS=86400
