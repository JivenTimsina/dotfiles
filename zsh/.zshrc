#source

. ~/.dotfiles/zsh/theme
. ~/.dotfiles/zsh/functions
. ~/.dotfiles/zsh/aliases

#plugins
. ~/.dotfiles/zsh/plugins/zsh-completions/zsh-completions.plugin.zsh
. ~/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
. ~/.dotfiles/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# completion
autoload -U compinit
compinit

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#555555'

#vi keybindings
bindkey -v

bindkey '?' autosuggest-accept

#history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

setopt autocd sharehistory histignorealldups

#Env
export TERMINAL=wezterm
export EDITOR="nvim"
export LANG="en_US.UTF-8"
export MANPAGER="nvim +Man!"

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#cargo bin
. "$HOME/.cargo/env"
