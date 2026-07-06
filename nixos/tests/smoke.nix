# Example VM test: boots a minimal machine and asserts a few baseline
# decisions from the real config hold (zsh available, ripgrep on PATH, nvim as
# EDITOR). Kept deliberately lightweight so it builds fast.
#
# To test an actual repo module instead of an inline node, import it, e.g.:
#   nodes.machine = { ... }: { imports = [ ../utils.nix ]; };
# (note: heavy modules pull large closures into the VM image).
{...}: {
  name = "smoke";

  nodes.machine = {pkgs, ...}: {
    programs.zsh.enable = true;
    environment.systemPackages = [pkgs.ripgrep];
    environment.sessionVariables.EDITOR = "nvim";
  };

  # Python test driver (./smoke.py). `machine` is the node defined above.
  testScript = builtins.readFile ./smoke.py;
}
