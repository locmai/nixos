# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  networking.hostName = "nixos"; # Define your hostname.

  networking.networkmanager.enable = true;


  nix.settings.experimental-features = ["nix-command" "flakes"];
  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  services.xserver.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.locmai = {
    isNormalUser = true;
    description = "Loc Mai";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    waybar
    mako
    libnotify
    rofi-wayland
    networkmanagerapplet
    dunst
    brave
  ];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };
  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };

  fonts.packages = with pkgs; [
    (nerdfonts.override {
      fonts = [
        "FiraCode"
      ];
    })
  ];

  xdg.portal = {
    enable = true;
    wlr.enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  # Sound
  # security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };
  # Enable the OpenSSH daemon.
  services.openssh.enable = true;
  services.dbus.enable = true;
  services.udev.enable = true;

  services.logind = {
    lidSwitch = "ignore";
  };

  systemd.services.handleLidClose = {
    description = "Handle lid close event";
    after = [ "multi-user.target" ];
    wantedBy = [ "multi-user.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.bash}/bin/bash -c 'while true; do if grep -q closed /proc/acpi/button/lid/LID/state; then hyprctl dispatch dpms off eDP-1; else hyprctl dispatch dpms on eDP-1; fi; sleep 1; done'";
      Restart = "always";
    };
  };
  
  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
