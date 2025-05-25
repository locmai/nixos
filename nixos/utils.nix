{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # utils
    btop
    cava
    curl
    fastfetch
    file
    fzf
    gcc
    gnumake
    gnupg
    go-task
    grim
    slurp
    htop
    openssl
    openssl.dev
    pinentry-curses
    ripgrep
    tree
    unzip
    vlc
    wget
    zinit

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
    gimp

    # network
    dig

    # messenger/video
    zoom-us
    signal-desktop

    # keyboard
    qmk
    vial
    libgcc
  ];
}
