{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    curl
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
