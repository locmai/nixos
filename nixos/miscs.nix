{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pinentry-curses
    usbutils

    eza
    devenv
    pokeget-rs
    libsForQt5.kdenlive
  ];
}
