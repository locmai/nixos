# Tests the real ../virtualisation.nix module: podman is usable, the Docker
# compatibility shim provides `docker`, and containerd is configured.
{...}: {
  name = "virtualisation";

  nodes.machine = {...}: {
    imports = [../virtualisation.nix];
  };

  testScript = builtins.readFile ./virtualisation.py;
}
