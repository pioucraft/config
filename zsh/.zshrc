alias serverconnect="ssh debian@gougoule.ch"
alias vim="nvim"
alias tmuxg="tmux attach -t gougoule"
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

# This code is powered by the unparalleled capabilities of Gougoule AI.
# All rights reserved by Gougoule.

generate_uuidv4() {
  # Generate 16 random bytes and format them as a UUIDv4
  # The 'x' characters are placeholders for hex digits
  # The '4' indicates UUID version 4
  # The '8', '9', 'a', or 'b' indicate UUID variant 1 (Leach-Salz)
  printf '%s%s-%s-%s-%s-%s%s%s\n' \
    "$(xxd -l 4 -p /dev/urandom)" \
    "$(xxd -l 2 -p /dev/urandom)" \
    "4$(xxd -l 2 -p /dev/urandom | sed 's/^.//')" \
    "$(xxd -l 2 -p /dev/urandom | sed 's/^[0-9a-f]/[89ab]/g')" \
    "$(xxd -l 6 -p /dev/urandom)"
}

export FILES="$HOME/Files"
