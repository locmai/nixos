{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # browser/terminal/message apps
    brave
    firefox
    google-chrome
    kitty
    neovim
    python3
    git
    tmux
    tree-sitter
    slack
    pinentry-curses
    yazi
    qt6.qtwayland
    libsForQt5.qt5.qttools
    usbutils
    xorg.xprop
    (pkgs.wrapOBS {
      plugins = with pkgs.obs-studio-plugins; [
        wlrobs
        obs-backgroundremoval
        obs-pipewire-audio-capture
      ];
    })
  ];
}
