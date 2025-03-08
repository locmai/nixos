# NixOS & Hyprland

## About

This repository contains my NixOS Linux configuration using `flake`, featuring the Hyprland window manager. I use this setup as my daily driver for work and programming. Feel free to use it as-is or adapt specific components for your own configuration.

Please note that this setup is not (yet) minimalistic, lightweight, or fully optimized, as I am still learning and experimenting.

## Components

- **Distro**: NixOS
- **Terminal**: Kitty
- **Shell**: Zsh
- **Display server**: Wayland
- **Window manager**: Hyprland
- **Bar**: Waybar
- **Launcher**: Rofi-Wayland
- **Wallpaper**: Hyprpaper
- **Lock screen**: Hyprlock
- **File manager**: Yazi
- **Browser**: Brave
- **Screenshot**: Grim + Slurp 
- **Colorscheme**: Gruvbox


![desktop](home/locmai/Pictures/Screenshots/startup.png)

![utilities](home/locmai/Pictures/Screenshots/utilities.png)

## Experimentals

The components under the `./nixos/experimentals/` directory are not yet fully tested and may not stay there for long.

## TODOs

- Configure dotfiles (home manager or chezmoi?)
- Fix `fcitx5` input method
