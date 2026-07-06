# NixOS VM test suite.
#
# Each attribute here is a VM test built with `pkgs.testers.runNixOSTest`
# (https://nixos.org/manual/nixos/stable/#sec-nixos-tests). They are exposed as
# flake `checks` (see ../flake.nix), so:
#
#   nix flake check ./nixos              # build & run every test
#   nix build ./nixos#checks.x86_64-linux.smoke   # run one test
#
# For interactive debugging of a single test, build its driver and drop into a
# Python REPL that drives the VM:
#
#   nix build ./nixos#checks.x86_64-linux.smoke.driverInteractive
#   ./result/bin/nixos-test-driver
#     >>> start_all()
#     >>> machine.shell_interact()   # interactive shell inside the guest
#
# Adding a test: create ./<name>.nix returning a runNixOSTest module
# ({ name; nodes; testScript; ... }) and register it below.
{pkgs}: {
  smoke = pkgs.testers.runNixOSTest (import ./smoke.nix);
  bluetooth = pkgs.testers.runNixOSTest (import ./bluetooth.nix);
  virtualisation = pkgs.testers.runNixOSTest (import ./virtualisation.nix);
}
