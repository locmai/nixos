{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    code-cursor
    icebreaker
    # zsh
    # fish
    # fishPlugins.grc
    # fishPlugins.fzf
    # fishPlugins.forgit
    # fishPlugins.sponge
    # fishPlugins.gruvbox
    oversteer
  ];
}
