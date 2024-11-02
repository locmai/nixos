{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    curl
    file
    fzf
    gcc
    gnumake
    gnupg
    grim
    slurp
    htop
    neofetch
    openssl
    openssl.dev
    pinentry-curses
    ripgrep
    tree
    unzip
    wget

    # jq/yq
    jsonnet
    jsonnet-bundler
    jq
    yq

    
    # Image/clipboard/screenshot
    cliphist
    ffmpeg_6-full
    gifsicle
    imagemagick
    swappy
    wl-screenrec
    wl-clipboard
    wl-clip-persist
    wtype
    wlrctl
    xdg-utils
  ];
}
