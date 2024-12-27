{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # temporary hack(s)
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
  };

  outputs = {
    self,
    nixpkgs,
    nixos-hardware,
    home-manager,
    hyprland-qtutils,
  }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixfmt-rfc-style;
    nixosConfigurations = {
      x1carbon = nixpkgs.lib.nixosSystem {
        specialArgs = {
          inherit hyprland-qtutils;
        };
        system = "x86_64-linux";
        modules = [
          ./auto-upgrade.nix
          ./bluetooth.nix
          ./bootloader.nix
          ./configuration.nix
          ./display-manager.nix
          ./fonts.nix
          ./gc.nix
          ./graphics.nix
          ./hardware-configuration.nix
          ./hyprland.nix
          ./kubernetes.nix
          ./theme.nix
          ./lsp.nix
          ./miscs.nix
          ./notifications.nix
          ./programmings.nix
          ./utils.nix
          ./virtualisation.nix
          nixos-hardware.nixosModules.lenovo-thinkpad-x1-10th-gen
          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}
