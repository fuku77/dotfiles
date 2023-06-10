#!/bin/env bash
# https://github.com/fuku77

Files=()

mkdir -p $HOME/.local/share/rofi



ROFI_CS_HISTFILE="$HOME/.local/share/rofi/rofi_cs_history"
ROFI_CS_HISTSIZE=5


echo -en "\0prompt\x1fConfigs\n"

# Handle selected entry
if [ -n "$1" ]; then
    # Append entry to history
    echo "$1" >> $ROFI_CS_HISTFILE
    
    # Remove excess lines from history
    [ "$( wc -l < "${ROFI_CS_HISTFILE}" )" -gt "${ROFI_CS_HISTSIZE}" ] && sed -i 1d "${ROFI_CS_HISTFILE}"
    
    # Launch editor
    coproc ( kitty nvim "$HOME/.config/$1" > /dev/null 2>&1 )
    exit 0
fi

# List history first
tac "$ROFI_CS_HISTFILE"

# List all files under .config (excluding ones in histfile)
while IFS= read -r -d '' f 
do
    grep -Fxq "$f" "$ROFI_CS_HISTFILE" || echo -en "${f##$HOME/.config/}\n"
done <  <(find "$HOME/.config" -type f -print0)
