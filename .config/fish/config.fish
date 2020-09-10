alias l "ls -al"

alias vim "nvim"
alias vi "nvim"

alias config 'git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias dockerps 'docker ps -q | xargs docker stats --no-stream'

alias wlfind 'wl list|fzf'
alias wllogs 'wlfind|xargs wl logs --open'
alias wlstatus 'wlfind|xargs wl status -o json'
alias wlvault 'wlstatus|jq -r '"'"'.deployment.description.components[0].env."$ref_secrets"[40:]'"'"'|xargs wl vault read'

# for awsenv
function set_aws 
  awsenv shell $argv | source
end
function login_aws 
  open (awsenv console $1)
end

function vaultof 
  set SERVICE "$argv"
  set VAULT_KEY_NAME '.deployment.description.components[0].env["$ref_secrets"]'
  wl status -o json $SERVICE | jq -r $VAULT_KEY_NAME | sed "s/vault+secret:\/\/vault.jimdo-platform.net\///"
end

function iname
  i3-msg rename workspace to (i3-msg -t get_workspaces | jq 'map(select(.focused))[0].name' | string replace -r "(<span font_desc.*?>) (\d*)(.*?)(</span>)" "\$1 \$2: $argv \$4")
end

alias pr "git push -u && hub pull-request -o -a luqasn $argv"
alias purge-xamarin "find . -iname 'bin' -type d -o -iname 'obj' -type d | tr '\n' '\0' | xargs -0 rm -rf"

export GOPATH=$HOME/go
set PATH /usr/local/opt/gettext/bin $PATH
set PATH $PATH $GOPATH/bin $HOME/bin
set PATH $HOME/.cargo/bin $PATH
set PATH $HOME/.local/bin $PATH
set PATH /usr/local/opt/python/libexec/bin $PATH

export EDITOR=nvim
export LC_ALL=en_US.UTF-8


eval (python -m virtualfish)
