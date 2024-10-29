{ pkgs, ... }:

{
  virtualisation = {
    podman = {
      enable = true;

      dockerCompat = true;

      defaultNetwork.settings.dns_enabled = true;
    };

    containerd = {
      enable = true;
    };
  };

  environment.systemPackages = with pkgs; [
    colima
    distrobox
    podman-compose
    qemu
  ];
}
