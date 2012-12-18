# alias
alias l='ls -al --color=auto'
alias ll='ls -al'
alias ..='cd ..'
alias 1..='cd ..'
alias 2..='cd ../..'
alias 3..='cd ../../..'
alias 4..='cd ../../../..'
alias 5..='cd ../../../../..'
alias 6..='cd ../../../../../..'
alias 7..='cd ../../../../../../..'
alias 8..='cd ../../../../../../../..'
alias 9..='cd ../../../../../../../../..'

# simple calc
cpy () {
  python -c "print ($*)"
}

# change rm to move to trash
rm () {
    local path
    for path in "$@"; do
        # ignore any arguments
        if [[ "$path" = -* ]]; then :
        else
            local dst=${path##*/}
            # append the time if necessary
            while [ -e ~/.Trash/"$dst" ]; do
                dst="$dst "$(date +%H-%M-%S)
            done
            mv "$path" ~/.Trash/"$dst"
        fi
    done
}

cmake_test() {
  vim ~/.cmake_tmp.cmake
  cmake $* -P ~/.cmake_tmp.cmake
}
