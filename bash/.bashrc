alias serverconnect="ssh debian@gougoule.ch"
alias vim="nvim"
alias tmuxg="tmux new-session -t gougoule"
alias localip="ipconfig getifaddr en0"

function gcommit() {
    git add . 
    echo "Enter commit message:"
    read msg
    git commit -m "$msg" 
    git push
}

function gdiff() {
    git add .
    git diff HEAD | delta
}
alias glines="git ls-files -z --exclude-standard | xargs -0 wc -l"

export GAI_MODEL="bfee6829-25cc-4112-9a46-a429ab1fb48d"
export GAI_URL="https://gougoule.ch/api/v1/"
alias gai="$HOME/git/pioucraft/gougoule-ai-frontend/main"


figlet -f nancyj-fancy "Gougoule"
function help() {
    echo -e "\e[1;31mNever quit !\e[0m"
    echo -e "\e[1;33mOne day,\e[0m"
    echo -e "\e[1;36mThe meaning will come\e[0m"
    echo -e "\e[1;32mYou're just building a path for it\e[0m"
}

export FILES="$HOME/Files"
export GITCONFIGPATH="$HOME/git/pioucraft/config"

alias l='exa --icons --group-directories-first --color=always --long --git'
alias f="fzf --preview 'bat --style=numbers --color=always {}'     --preview-window=right:60%:wrap:hidden     --bind '?:toggle-preview'"
alias n='nvim "$(date +"%d.%m.%Y, %H:%M:%S").txt"'

alias checkgitstatus="$GITCONFIGPATH/bash/scripts/checkgitstatus.sh $HOME/ $HOME/Files/Files $HOME/.cache"
