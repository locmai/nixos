{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    avizo
    dunst
    libnotify
    psi-notify
    psmisc
  ];
}
