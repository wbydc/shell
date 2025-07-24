#!/bin/bash
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
source "$SCRIPT_DIR/components/env.sh"

sudo apt update && sudo apt upgrade

sudo apt-get install -y \
  btop \
  ca-certificates \
  curl \
  gnupg \
  libgpgme11-dev \
  lsb-release \
  neovim 

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
curl -s https://ohmyposh.dev/install.sh | bash -s

components=(
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
