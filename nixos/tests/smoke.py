from typing import TYPE_CHECKING

# Injected by the NixOS test driver at runtime; typed here only for pyright. The
# build-time checker (ty) already knows these globals, so silence its import
# error while pyright resolves ./nixos_test_driver.pyi for in-editor types.
if TYPE_CHECKING:
    from nixos_test_driver import machine, subtest  # ty: ignore[unresolved-import]

machine.wait_for_unit("multi-user.target")

with subtest("zsh is installed and usable as a login shell"):
    machine.succeed("test -x $(command -v zsh)")
    machine.succeed("zsh -c 'echo hello' | grep -q hello")

with subtest("baseline package (ripgrep) is on PATH"):
    machine.succeed("rg --version")

with subtest('EDITOR session variable is set to "nvim"'):
    machine.succeed('grep -q \'EDITOR="nvim"\' /etc/set-environment')
