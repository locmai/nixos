{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    brave
    curl
    discord
    file
    fzf
    gcc
    git
    gnumake
    kitty
    neofetch
    neovim
    python3
    pavucontrol
    telegram-desktop
    tmux
    tree
    ripgrep
    slack
    unzip
    wget
  ];
}
