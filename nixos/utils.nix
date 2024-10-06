{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    pavucontrol
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
    telegram-desktop
    tmux
    tree
    ripgrep
    unzip
    wget
  ];
}
