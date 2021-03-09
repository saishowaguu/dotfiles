[ -f ~/.bashrc ] && . ~/.bashrc

# PROMPT

parse_exit_code() {
  [ $? == 0 ] && echo -e "\e[32m✓"
  [ $? != 0 ] && echo -e "\e[31m×"
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1) /'
}

parse_git_status() {
  STATUS=$(git status -s 2> /dev/null | wc -l)

  [ $STATUS != 0 ] && echo "* "
}

parse_git_behind() {
  BEHIND=$(git status -bs 2> /dev/null | sed -e '/^[^##]/d' | grep -o 'behind [0-9]*' | sed -e 's/[^0-9]//g')

  [ "$BEHIND" != "" ] && echo "$BEHIND↓ "
}

parse_git_ahead() {
  AHEAD=$(git status -bs 2> /dev/null | sed -e '/^[^##]/d' | grep -o 'ahead [0-9]*' | sed -e 's/[^0-9]//g')

  [ "$AHEAD" != "" ] && echo "$AHEAD↑ "
}

export PS1="\[\e[96m\]\u@\h \[\e[32m\]\w \[\e[91m\]\$(parse_git_branch)\$(parse_git_status)\[\e[93m\]\$(parse_git_behind)\$(parse_git_ahead)\[\e[00m\]$ "

# NODE SWITCHER

n() {
    case "$1" in
        6)
            export PATH=$(echo $PATH | sed 's#/opt/node/[^/]\+#/opt/node/node-v6.17.1-linux-x64#')
            node -v
            ;;
        10)
            export PATH=$(echo $PATH | sed 's#/opt/node/[^/]\+#/opt/node/node-v10.22.1-linux-x64#')
            node -v
            ;;
        12)
            export PATH=$(echo $PATH | sed 's#/opt/node/[^/]\+#/opt/node/node-v12.19.0-linux-x64#')
            node -v
            ;;
        lts)
            export PATH=$(echo $PATH | sed 's#/opt/node/[^/]\+#/opt/node/lts#')
            node -v
            ;;
        *)
            node -v
            ;;
    esac
}

alias gl="git log --all --decorate --oneline --graph"
