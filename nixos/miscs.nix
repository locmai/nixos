{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    pinentry-curses
    usbutils

    eza
    pokeget-rs

    yt-dlp
    audacity
    signal-desktop
  ];
}
