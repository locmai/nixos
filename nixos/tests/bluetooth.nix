# Tests the real ../bluetooth.nix module: bluez service present, power-on-boot
# policy applied, and the blueman applet installed.
{...}: {
  name = "bluetooth";

  nodes.machine = {...}: {
    imports = [../bluetooth.nix];
  };

  testScript = ''
    machine.wait_for_unit("multi-user.target")

    # hardware.bluetooth.enable defines the bluez unit
    machine.succeed("systemctl cat bluetooth.service")

    # powerOnBoot = true => AutoEnable in bluez main.conf
    machine.succeed("grep -iE 'AutoEnable *= *true' /etc/bluetooth/main.conf")

    # services.blueman.enable installs the applet
    machine.succeed("command -v blueman-applet")
  '';
}
