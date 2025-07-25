zstyle ':omz:plugins:nvm' autoload no

function nvm_autoload() {  
  if command -v nvm >/dev/null 2>&1; then  
    local dir="$PWD"  
    while [[ "$dir" != "/" ]]; do  
      if [[ -f "$dir/.nvmrc" ]]; then  
        nvm use  
        return  
      fi  
      dir=${dir:h}  
    done  
  fi  
}

add-zsh-hook chpwd nvm_autoload
nvm_autoload
