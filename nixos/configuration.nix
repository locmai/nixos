{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];

  networking.hostName = "nixos";

  networking.networkmanager.enable = true;
  services.resolved = {
    enable = true;
    domains = ["1.1.1.1" "1.0.0.1"];
    fallbackDns = ["8.8.8.8" "8.8.4.4"];
  };
  time.timeZone = "Asia/Ho_Chi_Minh";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  programs = {
    nix-ld.enable = true;
    zsh = {
      enable = true;
      shellInit = ''
        export NIX_LD=$(nix eval --impure --raw --expr 'let pkgs = import <nixpkgs> {}; NIX_LD = pkgs.lib.fileContents "${pkgs.stdenv.cc}/nix-support/dynamic-linker"; in NIX_LD')
      '';
    };
    direnv = {
      enable = true;
      silent = true;
    };
  };
  # TODO update user per host when new ones are added
  users.users.locmai = {
    isNormalUser = true;
    description = "Loc Mai";
    shell = pkgs.zsh;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      youtube-music
    ];
  };

  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enable = true;
      type = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-gtk
          fcitx5-configtool
          fcitx5-with-addons
          fcitx5-bamboo
        ];
        settings = {
          inputMethod = {
            "Groups/0" = {
              "Name" = "Default";
              "Default Layout" = "us";
              "DefaultIM" = "keyboard-us";
            };
            "Groups/0/Items/0" = {
              "Name" = "keyboard-us";
            };
            "Groups/0/Items/1" = {
              "Name" = "bamboo";
            };
          };
          globalOptions = {
            "Behavior" = {
              "ShowInputMethodInformation" = "False";
            };
            "Hotkey/EnumerateForwardKeys" = {
              "0" = "Alt+Shift+Ctrl";
            };
          };
          addons = {
            bamboo = {
              globalSection = {
                InputMethod = "Telex 2";
              };
            };
          };
        };
      };
    };
  };

  # Allow unfree packages and broken like my heart
  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowBroken = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    pamixer
    pavucontrol
    playerctl
    rofi-wayland
    waybar
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # Sound
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    wireplumber.enable = true;
  };

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  programs.ssh.startAgent = true;
  services.dbus.enable = true;
  services.udev.enable = true;

  system.stateVersion = "24.11";
}
