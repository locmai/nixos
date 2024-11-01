{ pkgs, ... }:

{
  environment.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    EDITOR = "nvim";
    KUBE_EDITOR = "nvim";
  };

  environment.systemPackages = with pkgs; [
    # browser/terminal/message apps
    brave
    google-chrome
    kitty
    neofetch
    neovim
    python3
    git
    go
    nodejs_22
    rustc
    tmux
    slack
    pinentry-curses
    yazi
    qt6.qtwayland
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
