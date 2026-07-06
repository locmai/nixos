from typing import TYPE_CHECKING

# Injected by the NixOS test driver at runtime; typed here only for pyright. The
# build-time checker (ty) already knows these globals, so silence its import
# error while pyright resolves ./nixos_test_driver.pyi for in-editor types.
if TYPE_CHECKING:
    from nixos_test_driver import machine, subtest  # ty: ignore[unresolved-import]

machine.wait_for_unit("multi-user.target")

with subtest("hardware.bluetooth.enable defines the bluez unit"):
    machine.succeed("systemctl cat bluetooth.service")

with subtest("powerOnBoot => AutoEnable in bluez main.conf"):
    machine.succeed("grep -iE 'AutoEnable *= *true' /etc/bluetooth/main.conf")

with subtest("services.blueman.enable installs the applet"):
    machine.succeed("command -v blueman-applet")
