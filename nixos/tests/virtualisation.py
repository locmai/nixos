from typing import TYPE_CHECKING

# Injected by the NixOS test driver at runtime; typed here only for pyright. The
# build-time checker (ty) already knows these globals, so silence its import
# error while pyright resolves ./nixos_test_driver.pyi for in-editor types.
if TYPE_CHECKING:
    from nixos_test_driver import machine, subtest  # ty: ignore[unresolved-import]

machine.wait_for_unit("multi-user.target")

with subtest("podman itself works"):
    machine.succeed("podman --version")
    machine.succeed("podman info")

with subtest("dockerCompat provides a `docker` command backed by podman"):
    machine.succeed("docker --version")

with subtest("containerd.enable defines the service"):
    machine.succeed("systemctl cat containerd.service")

with subtest("podman-compose is on PATH"):
    machine.succeed("podman-compose --version")
