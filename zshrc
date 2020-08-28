
autoload colors zsh/terminfo
colors

#if [ "$TMUX" = "" ]; then tmux; fi

# git info
# Load version control information
autoload -Uz vcs_info
setopt prompt_subst
precmd() { print ""; vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats ' %b '
PROMPT='%{$fg[magenta]%}${vcs_info_msg_0_}%{$reset_color%}%B⟩%b'
RPROMPT="%{$fg[magenta]%}%20<...<%~%<<%{$reset_color%}"

setopt auto_cd

setopt correctall
alias git status='nocorrect git status'
alias vi=nvim

## Command history configuration
HISTFILE=$HOME/.zsh_history

HISTSIZE=10000
SAVEHIST=10000

# Show history
case $HIST_STAMPS in
  "mm/dd/yyyy") alias history='fc -fl 1' ;;
  "dd.mm.yyyy") alias history='fc -El 1' ;;
  "yyyy-mm-dd") alias history='fc -il 1' ;;
  *) alias history='fc -l 1' ;;
esac

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups # ignore duplication command history list
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history

alias l='ls -al'



alias pr='git push -u && hub pull-request -o'
alias purge-xamarin=find . -iname "bin" -type d -o -iname "obj" -type d | tr '\n' '\0' | xargs -0 rm -rf

export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin:$HOME/bin
export PATH="/usr/local/opt/gettext/bin:$PATH"

export EDITOR=nvim

# for awsenv
function set_aws {
  eval $(awsenv shell $1)
}
function login_aws {
  open $(awsenv console $1)
}

function vaultof {
  SERVICE="$1"
  VAULT_KEY_NAME='.deployment.description.components[0].env["$ref_secrets"]'
  wl status -o json $SERVICE | jq -r $VAULT_KEY_NAME | sed "s/vault+secret:\/\/vault.jimdo-platform.net\///"
}

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"

. /usr/local/etc/profile.d/z.sh
. /usr/local/bin/virtualenvwrapper.sh

#if command -v pyenv 1>/dev/null 2>&1; then
#  eval "$(pyenv init -)"
#fi
