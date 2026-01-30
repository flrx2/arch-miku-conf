#!/bin/bash

set -e  

echo "Начинается..."

BACKUP_DIR="$HOME/.backup_dotfiles"
mkdir -p "$BACKUP_DIR"

backup() {
    if [ -e "$1" ]; then
        echo "Backing up $1 → $BACKUP_DIR"
        mv "$1" "$BACKUP_DIR/"
    fi
}


backup "$HOME/.config/hypr"
backup "$HOME/.config/fish"
backup "$HOME/.config/wofi"
backup "$HOME/.config/kitty"

if [ -f "packages.txt" ]; then
    echo "Работает пакман..."
    sudo pacman -S --needed - < packages.txt
fi

echo "Копируем..."

# Простой вариант — копируем
cp -r hypr "$HOME/.config/"
cp -r fish "$HOME/.config/"
cp -r wofi "$HOME/.config/"
cp -r kitty "$HOME/.config/"
cp -r walapper "$HOME"
swww img walapper/hatsune-miku-2560x1440-24858.png

mkdir -p ~/.icons
cp -r cursors/miku-cursor-linux ~/.icons/

CONF="$HOME/.config/hypr/hyprland.conf"

# cursor_theme
if grep -q "^cursor_theme" "$CONF"; then
    sed -i 's/^cursor_theme.*/cursor_theme = miku-cursor-linux/' "$CONF"
else
    echo "cursor_theme = miku-cursor-linux" >> "$CONF"
fi

# cursor_size
if grep -q "^cursor_size" "$CONF"; then
    sed -i 's/^cursor_size.*/cursor_size = 24/' "$CONF"
else
    echo "cursor_size = 24" >> "$CONF"
fi

sh -c "$(curl -fsSL https://raw.githubusercontent.com/noraj/refind-theme-regular/master/install.sh)"
sudoedit /boot/efi/EFI/refind/themes/refind-theme-regular/theme.conf
git clone -b main --depth=1 https://github.com/uiriansan/SilentSDDM && cd SilentSDDM && ./install.sh

echo "Надеюсь работает"
