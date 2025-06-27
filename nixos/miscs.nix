{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pinentry-curses
    usbutils

    eza
    pokeget-rs
    libsForQt5.kdenlive

    yt-dlp
    audacity
  ];
}
