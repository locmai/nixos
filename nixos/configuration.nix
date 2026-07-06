{pkgs, ...}: {
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
  ];
  hardware.keyboard.qmk.enable = true;

  networking = {
    hostName = "nixos";
    networkmanager = {
      enable = true;
      # Prioritize WiFi over Ethernet by setting route metrics
      # Lower metric = higher priority
      settings = {
        "connection-wifi" = {
          # WiFi is faster and preferred over Ethernet for my own use case
          "match-device" = "type:wifi";
          "ipv4.route-metric" = 50;
        };
        "connection-ethernet" = {
          # Ethernet goes through Samsung monitor KVM, slower than WiFi
          "match-device" = "type:ethernet";
          "ipv4.route-metric" = 600;
        };
      };
    };
    nameservers = ["1.1.1.1" "1.0.0.1"];
  };

  services.resolved = {
    enable = true;
    domains = ["1.1.1.1" "1.0.0.1"];
    fallbackDns = ["8.8.8.8" "8.8.4.4"];
  };

  time.timeZone = "America/Los_Angeles";

  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];

  environment.sessionVariables = {
    PKG_CONFIG_PATH = "${pkgs.openssl.dev}/lib/pkgconfig";
    EDITOR = "nvim";
    KUBE_EDITOR = "nvim";
    SHELL = "zsh";
  };

  programs = {
    zsh.enable = true;
    fish.enable = true;
    nix-ld.enable = true;
    direnv = {
      enable = true;
      silent = true;
    };
  };

  users.users.locmai = {
    isNormalUser = true;
    description = "Loc Mai";
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
          libsForQt5.fcitx5-qt
          qt6Packages.fcitx5-configtool
          qt6Packages.fcitx5-with-addons
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
              "0" = "Shift+Super+Ctrl";
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

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    pamixer
    pavucontrol
    playerctl
    rofi
    waybar
    gbar
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # Sound
  security.rtkit.enable = true;
  services.pulseaudio.enable = false;
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
  services.udev = {
    enable = true;
    packages = with pkgs; [
      via
    ];
    # extraRules = builtins.readFile ./udev/50-qmk.rules;
  };
  services.tlp = {
    enable = true;
    settings = {
      # intel_pstate: "powersave" is the dynamic governor (still bursts to
      # turbo under load); "performance" pins all cores to max clock.
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
      # EPP hint (energy vs. performance) within the chosen governor.
      CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
      CPU_ENERGY_PERF_POLICY_ON_BAT = "balance_power";
      # Allow turbo boost on AC, disable it on battery to cut heat/drain.
      CPU_BOOST_ON_AC = 1;
      CPU_BOOST_ON_BAT = 0;
    };
  };

  system.stateVersion = "25.11";
}
