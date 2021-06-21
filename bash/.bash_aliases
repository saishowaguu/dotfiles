alias dotfiles="git --git-dir $HOME/.dotfiles --work-tree $HOME"
alias gl="git log --all --decorate --oneline --graph"
alias vi="nvim"
alias gp="git push -u origin HEAD"
alias gs="git status -sb"

gwa() {
  git worktree add --guess-remote $1 $2
}

