{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    usbutils

    eza
    pokeget-rs

    yt-dlp
    audacity
    signal-desktop
  ];
}
