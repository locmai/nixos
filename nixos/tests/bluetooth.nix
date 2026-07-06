# Tests the real ../bluetooth.nix module: bluez service present, power-on-boot
# policy applied, and the blueman applet installed.
{...}: {
  name = "bluetooth";

  nodes.machine = {...}: {
    imports = [../bluetooth.nix];
  };

  testScript = builtins.readFile ./bluetooth.py;
}
