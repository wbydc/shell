source "$HOME/.local/shell/components/env.sh"

ZSH_THEME="apple"

plugins=(
  dirhistory
  docker
  dotenv
  emoji
  git
  golang
  gpg-agent
  nvm
  ssh
  ssh-agent
  zsh-autosuggestions
)

source "$SHELL_CONFIG/config.sh"
source $ZSH/oh-my-zsh.sh

autoload -U add-zsh-hook

components=(
  aliases
  git
  go
  kubectl
)

for component in "${components[@]}"; do  
  source "$SHELL_CONFIG/components/$component.sh"  
done
unset component

eval "$(oh-my-posh init zsh --config $SHELL_CONFIG/posh/wbydc.omp.json)"
