
# ~/.zshrc
alias editrc='nvim ~/.zshrc'
alias sourcerc='source ~/.zshrc'

# lazygit
alias lg='lazygit'

# cd
alias cdf='cd "$(fd -t d | fzf)"'
alias cdfH='cd "$(fd -H -t d | fzf)"'
alias cdfh='cd "$(fd . ~ -t d | fzf)"'
alias cdfhH='cd "$(fd -H . ~ -t d | fzf)"'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ls
alias ls='ls -GF'

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





