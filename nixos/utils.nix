{ pkgs, ... }:

{
  environment.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    EDITOR = "nvim";
    KUBE_EDITOR = "nvim";
    GTK_IM_MODULE = "ibus";
    QT_IM_MODULE = "ibus";
    XMODIFIERS = "@im=ibus";
  };

  environment.systemPackages = with pkgs; [
    avizo
    brave
    colima
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
    htop

    yazi

    jsonnet
    jsonnet-bundler
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

    rust-analyzer
    rustfmt
    nixfmt-rfc-style
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })
  ];
}
