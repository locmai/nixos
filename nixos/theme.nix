{pkgs, ...}: {
  environment.variables.GTK_THEME = "Gruvbox-Dark-BL-LB";
  environment.variables.XCURSOR_SIZE = "24";
  environment.variables.HYPRCURSOR_SIZE = "24";
  # qt.enable = true;
  # qt.platformTheme = "gtk2";
  # qt.style = "gruvbox-dark";
  console = {
    earlySetup = true;
    colors = [
      "24273a"
      "ed8796"
      "a6da95"
      "eed49f"
      "8aadf4"
      "f5bde6"
      "8bd5ca"
      "cad3f5"
      "5b6078"
      "ed8796"
      "a6da95"
      "eed49f"
      "8aadf4"
      "f5bde6"
      "8bd5ca"
      "a5adcb"
    ];
  };

  # Override packages
  nixpkgs.config.packageOverrides = pkgs: {
    colloid-icon-theme = pkgs.colloid-icon-theme.override {colorVariants = ["default"];};
    discord = pkgs.discord.override {
      withOpenASAR = true;
      withTTS = true;
    };
  };

  environment.systemPackages = with pkgs; [
    numix-icon-theme-circle
    colloid-icon-theme

    gruvbox-gtk-theme
    gruvbox-kvantum
    gruvbox-dark-icons-gtk
  ];
}
