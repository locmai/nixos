{ pkgs, ...}:

{
  environment.sessionVariables.PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
  environment.systemPackages = with pkgs; [
    avizo
    brave
    curl
    discord
    file
    fzf
    gcc
    git
    gnumake
    grim
    kitty
    neofetch
    neovim
    openssl
    openssl.dev
    python3
    rustc
    slurp
    telegram-desktop
    tmux
    tree
    ripgrep
    slack
    unzip
    wget



    at-spi2-atk
    qt6.qtwayland
    psi-notify
    poweralertd
    playerctl
    psmisc
    grim
    slurp
    imagemagick
    swappy
    ffmpeg_6-full
    wl-screenrec
    wl-clipboard
    wl-clip-persist
    cliphist
    xdg-utils
    wtype
    wlrctl
    gifsicle
  ];
}
