# Tests the real ../virtualisation.nix module: podman is usable, the Docker
# compatibility shim provides `docker`, and containerd is configured.
{...}: {
  name = "virtualisation";

  nodes.machine = {...}: {
    imports = [../virtualisation.nix];
  };

  testScript = ''
    machine.wait_for_unit("multi-user.target")

    # podman itself works
    machine.succeed("podman --version")
    machine.succeed("podman info")

    # dockerCompat = true provides a `docker` command backed by podman
    machine.succeed("docker --version")

    # containerd.enable defines the service
    machine.succeed("systemctl cat containerd.service")

    # podman-compose is on PATH
    machine.succeed("podman-compose --version")
  '';
}
