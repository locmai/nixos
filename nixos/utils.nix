{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    pavucontrol
    curl
    discord
    file
    gcc
    git
    gnumake
    kitty
    neofetch
    neovim
    python3
    tmux
    tree
    unzip
    wget
  ];
}
