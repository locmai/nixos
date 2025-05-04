{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    code-cursor
    starship
    zsh
    fish
    fishPlugins.grc
    fishPlugins.fzf
    fishPlugins.forgit
    fishPlugins.sponge
    fishPlugins.gruvbox
  ];
}
