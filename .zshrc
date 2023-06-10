# https://github.com/fuku77
#
# Delete the sections you don't want
export ZSH="$HOME/.local/share/oh-my-zsh/"

source "$HOME/.fk/env"

autoload -Uz compinit
autoload -U promptinit; promptinit

## ALIASES ##
source "$HOME/.config/zsh/aliases"

## ENVIRONMENT VARIABLES ##
source "$HOME/.config/zsh/env"

## AUTO SYSTEM UPDATE PROMPT ##
# You need to have a cronjob like this:
# 0 0 1 * * echo 1 > /home/username/.config/zsh/autoupdate/pendingupdate
grep -q 1 "$HOME"/.config/zsh/autoupdate/pendingupdate &&
	source "$HOME/.config/zsh/autoupdate/autoupdateprompt"

## ZSH CONFIG ##
prompt pure
#ZSH_THEME="clean"

ENABLE_CORRECTION="false"

#COMPLETION_WAITING_DOTS="%F{yellow}...%f"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	git
	zsh-autosuggestions
)

## Start OMZ
# Any configuration must be done before this line.
source "$ZSH/oh-my-zsh.sh"

## ZSH AUTOSUGGESTIONS ##
source "$HOME/.config/zsh/asrc"

#### PFETCH CONFIGURATION ####
#
# Which information to display.
# NOTE: If 'ascii' will be used, it must come first.
# Default: first example below
# Valid: space separated string
#
# OFF by default: shell editor wm de palette
export PF_INFO="os wm uptime pkgs shell memory palette"

# ghcup haskell thing
[ -f "/home/zen/.ghcup/env" ] && source "/home/zen/.ghcup/env" # ghcup-env
