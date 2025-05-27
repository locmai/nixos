{
  pkgs,
  hyprland-qtutils,
  ...
}: {
  programs.hyprland.enable = true;
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    WLR_NO_HARDWARE_CURSORS = "1";
    XMODIFIERS = "@im=fcitx";
    QT_IM_MODULE = "fcitx";
  };
  environment.systemPackages = with pkgs; [
    pyprland
    hyprpicker
    hyprcursor
    hyprlock
    hypridle
    hyprpaper
    pyprland
    hyprland-qtutils.packages."${pkgs.system}".default

    gbar
  ];
}
