# Show profile results
if [[ -n "${ZSH_DEBUGRC+1}" ]]; then
  zmodload zsh/zprof
fi

source $HOME/.zsh/zinit/zinit.zsh \
    || (git clone --depth 1 https://github.com/zdharma-continuum/zinit.git $HOME/.zsh/zinit && exec zsh)

# Theme
zinit light-mode depth=1 atload="source $HOME/.p10k.zsh" for romkatv/powerlevel10k

# Plugin list
zinit wait lucid light-mode depth=1 nocd for \
    atinit'ZINIT[COMPINIT_OPTS]=-C; zicompinit; zicdreplay' zdharma-continuum/fast-syntax-highlighting \
    atload='_zsh_autosuggest_start' zsh-users/zsh-autosuggestions \
    atload='MODE_CURSOR_VIINS="bar"; vim-mode-cursor-init-hook' softmoth/zsh-vim-mode
zinit wait lucid is-snippet for \
    https://github.com/ahmetb/kubectl-aliases/blob/master/.kubectl_aliases \
    https://github.com/junegunn/fzf/blob/master/shell/key-bindings.zsh

# Aliases (only when interactive)
[[ -o interactive && -f $HOME/.aliases ]] && source $HOME/.aliases

# Show profile results
if [[ -n "${ZSH_DEBUGRC+1}" ]]; then
  zprof
fi

# PATH adjustments
export PATH="$HOME/go/bin:$HOME/.cargo/bin:$PATH"
