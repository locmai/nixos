{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pinentry-curses
    usbutils

    eza
    carbon-now-cli
    pokeget-rs
    libsForQt5.kdenlive
  ];
}
