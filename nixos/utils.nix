{ pkgs, ...}:

{
  environment.sessionVariables.PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
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
    openssl
    openssl.dev
    python3
    pavucontrol
    rustc
    telegram-desktop
    tmux
    tree
    ripgrep
    slack
    unzip
    wget
  ];
}
