 if status is-interactive
 fastfetch
 set fish_greeting

 set -Ux PATH $HOME/.local/bin $PATH

 alias sp='sudo pacman -S'
 alias s='sudo'
 alias nv='nvim'
 alias syu='sudo pacman -Syu'
 alias nanoh='nano ~/.config/hypr/hyprland.conf'
end
