#!/bin/bash
source "$HOME/.local/shell/components/env.sh"

sudo apt update && sudo apt upgrade

sudo apt-get install -y \
  btop \
  ca-certificates \
  curl \
  gnupg \
  libgpgme11-dev \
  lsb-release \
  neovim 

components=(
  zsh
  git
  gmd
  go
  kubectl
  nvm
)

for component in "${components[@]}"; do  
  source "$SHELL_CONFIG/install/$component.sh"  
done

touch "$SHELL_CONFIG/config.sh" && chmod 600 "$SHELL_CONFIG/config.sh"
echo "source $SHELL_CONFIG/zshrc" > "$HOME/.zshrc"

