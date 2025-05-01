{pkgs, ...}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.configurationLimit = 2;
      efi.canTouchEfiVariables = true;
      timeout = 0;
    };
    initrd.enable = true;
    initrd.systemd.enable = true;
    consoleLogLevel = 0;

    kernelParams = [
      "quiet"
      "splash"
      "boot.shell_on_fail"
      "loglevel=3"
      "rd.systemd.show_status=false"
      "rd.udev.log_level=3"
      "udev.log_priority=3"
    ];

    plymouth = {
      enable = true;
      font = "${pkgs.nerdfonts}/share/fonts/truetype/NerdFonts/FiraCodeNerdFont-Regular.ttf";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = ["deus_ex"];
        })
      ];
      theme = "deus_ex";
    };
  };
}
