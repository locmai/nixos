{pkgs, ...}: {
  environment.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    EDITOR = "nvim";
    KUBE_EDITOR = "nvim";
    GPG_TTY = "$(tty)";
  };

  environment.systemPackages = with pkgs; [
    # browser/terminal/message apps
    brave
    firefox
    google-chrome
    kitty
    neofetch
    neovim
    python3
    git
    go
    tmux
    tree-sitter
    slack
    pinentry-curses
    yazi
    qt6.qtwayland
    libsForQt5.qt5.qttools
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })
  ];
}
