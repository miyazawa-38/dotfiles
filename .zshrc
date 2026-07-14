# ~/.zshrc
alias editrc='nvim ~/.zshrc'
alias sourcerc='source ~/.zshrc'

# HomebrewのPythonとスクリプトにパスを通す
export PATH="/opt/homebrew/bin:/opt/homebrew/opt/python@3.12/libexec/bin:$PATH"

# starship（vi modeと競合しないよう先にzle-keymap-selectを定義）
function zle-keymap-select() { zle reset-prompt }
zle -N zle-keymap-select
eval "$(starship init zsh)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# mise
eval "$(mise activate zsh)"

# fnm
eval "$(fnm env --use-on-cd)"

# lazygit
alias lg='lazygit'

# Go
export GOPATH="$HOME/go"
export PATH="$PATH:$GOPATH/bin"

# direnv
eval "$(direnv hook zsh)"

# cd
alias cdf='cd "$(fd -t d | fzf)"'
alias cdfH='cd "$(fd -H -t d | fzf)"'
alias cdfh='cd "$(fd . ~ -t d | fzf)"'
alias cdfhH='cd "$(fd -H . ~ -t d | fzf)"'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ls
export CLICOLOR=1
alias ls='ls -GF'
# alias ls='ls -F'

# grep
alias grep='grep --color=auto'

# grep
alias diff='diff --color=auto'

# mv
alias rm='rm -i'
alias rmf='rm $(fd | fzf)'

# open .
alias o='open .'

# nvim
alias n='nvim'
alias nf='nvim $(fd -t f | fzf)'
alias nfH='nvim $(fd -H -t f | fzf)'

# fd 
alias f='fd | fzf'
alias fH='fd -H | fzf'
alias fh='fd . ~ | fzf'
alias fhH='fd -H . ~ | fzf'

# git
alias g='git'
alias gs='git status'
alias gd='git diff'
alias ga='git add'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gb='git branch'
alias gcheckout='git checkout'
alias grestore='git restore'

# Anipos
alias m='make'


# claude
alias clauded='claude --dangerously-skip-permissions'

# Obsidian
obs() {
  open -a "Obsidian" "$(realpath "${1:-.}")"
}

# # Viモード
# bindkey -v
# export KEYTIMEOUT=1
