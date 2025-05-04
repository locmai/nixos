{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    code-cursor
    fish
    starship
    fishPlugins.fzf-fish
    fishPlugins.forgit
  ];
}
