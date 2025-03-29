
HISTFILE=~/.zsh-history
HISTSIZE=10000
SAVEHIST=10000
zstyle :compinstall filename '/home/vishnu/.zshrc'
autoload -Uz compinit
compinit

source /home/vishnu/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /home/vishnu/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source <(fzf --zsh)

fcd() {
cd "$(find -type d | fzf)"
}

open() {
xdg-open "$(find -type f | fzf)"
}

alias getpath="find -type f | fzf | sed 's/^..//' | tr -d '\n' | copyq add -"


PROMPT=$'%{\e[0;34m%}%B┌─[%b%{\e[1;32m%}%n%{\e[1;37m%}@%{\e[1;37m%}%{\e[1;31m%}%m%{\e[0;34m%}%B]%b%{\e[0m%} - %b%{\e[0;34m%}%B[%b%{\e[1;38;5;214m%}%~%{\e[0;34m%}%B]%b%{\e[0m%} - %{\e[0;34m%}%B[%b%{\e[38;5;214m%}'%D{"%a %b %d, %I:%M %p"}%b$'%{\e[0;34m%}%B]%b%{\e[0m%}
%{\e[0;34m%}%B└─%B[%{\e[1;35m%}$%{\e[0;34m%}%B]%{\e[0m%} '

fastfetch
