HISTFILE="$HOME/.zsh-history"
HISTSIZE=5000
SAVEHIST=5000

zstyle :compinstall filename "$HOME/.zshrc"
autoload -Uz compinit
compinit

source /home/vishnu/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/vishnu/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /home/vishnu/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source <(fzf --zsh)

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

fcd() {
cd "$(find -type d | fzf)"
}

open() {
xdg-open "$(find -type f | fzf)"
}

getpath() {
echo $(find -type f | fzf | sed 's/^..//' | tr -d '\n') | wl-copy
}

function clean_history {
    awk '!seen[$0]++' "$HISTFILE" > "$HISTFILE.tmp" && mv "$HISTFILE.tmp" "$HISTFILE"
}

trap clean_history EXIT

PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[1;32m%}%n%{\e[1;37m%}@%{\e[1;37m%}%{\e[1;31m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} - %b%{\e[0;34m%}%B[%b%{\e[1;38;5;214m%}%~%{\e[0;34m%}%B]%b%{\e[0m%} - %{\e[0;34m%}%B[%b%{\e[38;5;214m%}'%D{"%a %b %d, %I:%M %p"}%b$'%{\e[0;34m%}%B]%b%{\e[0m%}
%{\e[0;34m%}%B└─%B[%{\e[1;35m%}$%{\e[0;34m%}%B]%{\e[0m%} '

fastfetch