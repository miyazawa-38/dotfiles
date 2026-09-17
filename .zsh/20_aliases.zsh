# ~/.zshrc
alias erc='nvim ~/.zshrc'
alias src='source ~/.zshrc'

# lazygit
alias lg='lazygit'

# cd
alias cdf='cd "$(fd -H -t d | fzf)"'
# alias cdfH='cd "$(fd -H -t d | fzf)"'
alias cdfh='cd "$(fd -H . ~ -t d | fzf)"'
# alias cdfhH='cd "$(fd -H . ~ -t d | fzf)"'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# ls
alias ls='ls -GF'

# mkdir
alias md='mkdir'

# grep
alias grep='grep --color=auto'

# grep
alias diff='diff --color=auto'

# mv
alias rm='rm -i'
alias rmf='rm $(fd | fzf)'

# open .
alias o='open .'

# vim
alias v='vim'
alias vf='vim $(fd -H -t f | fzf)'

# nvim
alias n='nvim'
alias nf='nvim $(fd -H -t f | fzf)'
# alias nfH='nvim $(fd -H -t f | fzf)'

# fd 
alias f='fd -H | fzf'
# alias fH='fd -H | fzf'
alias fh='fd -H . ~ | fzf'
# alias fhH='fd -H . ~ | fzf'
alias fg='fd | grep'

# git
alias g='git'
alias ga='git add'
alias gb='git branch'
alias gc='git commit -v'
alias gca='git commit -v --amend'
alias gco='git checkout'
alias gd='git diff'
alias gf='git fetch'
alias gg='git grep'
alias gl='git log'
alias gll='git pull'
alias glo='git log --oneline'
alias gm='git merge'
alias gp='git push'
alias gr='git restore'
alias gs='git status'
alias gsl='git stash list'
alias gsp='git stash pop'
alias gsw='git switch'
alias gss='git stash push -u'

# github
alias ghic='gh issue create --editor'
alias ghie='gh issue edit'
alias ghil='gh issue list'
alias ghiv='gh issue view'
alias ghpc='gh pr create --editor'
alias ghpl='gh pr list'

# Makefile
alias m='make'

# claude
alias clauded='claude --dangerously-skip-permissions'





