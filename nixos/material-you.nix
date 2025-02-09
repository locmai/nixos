{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    python3
    hyprshot
    hyprcursor
    hyprlang
    hyprpicker
    hyprutils
    hyprwayland-scanner
    xdg-dbus-proxy
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland
    xdg-utils
    python312Packages.pyxdg
    ags
    swww
    adw-gtk3
    libdbusmenu-gtk3
    python312Packages.pip
    python312Packages.pillow
    gnome.gnome-bluetooth
    bluez-tools
    wl-clipboard
    pywal16
    libadwaita
    swappy
    nwg-look
    pavucontrol
    polkit_gnome
    brightnessctl
    gvfs
    xarchiver
    zip
    imagemagick
    fastfetch # # #
    bibata-cursors
    gum
    python312Packages.pywayland
    libdrm
    lm_sensors
    gnome-system-monitor
    playerctl
    lshw
    dart-sass
    cpio
    meson
    cmake
    python312Packages.materialyoucolor
    gtksourceview
    gtksourceviewmm
    cairomm
    gtkmm3
    networkmanagerapplet
    tinyxml-2
    python312Packages.requests
    hyprpaper
    (tela-icon-theme.overrideAttrs (_: {
      installPhase = ''
        runHook preInstall

        patchShebangs install.sh
        mkdir -p $out/share/icons
        ./install.sh nord -d $out/share/icons
        jdupes -l -r $out/share/icons

        runHook postInstall
      '';
    }))
    webcord-vencord
    bun
  ];
  # programs.bun.enable = true;
  # services.udiskie.enable = true;
  # services.cliphist.enable = true;
}
