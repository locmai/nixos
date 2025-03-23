{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # utils
    btop
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

    # jq/yq/json
    jsonnet
    jsonnet-bundler
    jq
    yq

    # image/clipboard/screenshot
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

    # network
    dig
  ];
}
