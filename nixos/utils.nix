{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # browser/terminal/message apps
    brave
    firefox
    google-chrome
    kitty
    qt6.qtwayland
    libsForQt5.qt5.qttools
    steam

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
    yazi
    zinit

    # OBS
    xorg.xprop
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })

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
    gurk-rs

    # keyboard
    qmk
    vial
    libgcc
  ];
}
