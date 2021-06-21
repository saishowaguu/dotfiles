alias gl="git log --all --decorate --oneline --graph"
alias vi="nvim"
alias gp="git push -u origin HEAD"
alias gs="git status -sb"
alias n="nvm use"

gwa() {
  git worktree add --guess-remote $1 $2
}

