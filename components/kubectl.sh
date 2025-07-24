function kubecontext_auto_switch() {  
  local dir="$PWD"  
  while [[ "$dir" != "/" ]]; do  
    if [[ -f "$dir/.kubecontext" ]]; then  
      local desired_context  
      desired_context=$(<"$dir/.kubecontext")  
      if [[ -n "$desired_context" ]]; then  
        local current_context  
        current_context=$(kubectl config current-context 2>/dev/null)  
        if [[ "$desired_context" != "$current_context" ]]; then  
          kubectl config use-context "$desired_context" >/dev/null 2>&1 && \  
            echo "Switched kubectl context to '$desired_context' (from $dir/.kubecontext)"  
        fi  
      fi  
      return  
    fi  
    dir=${dir:h}  
  done  
}

add-zsh-hook chpwd kubecontext_auto_switch
kubecontext_auto_switch
