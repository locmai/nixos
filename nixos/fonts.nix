{ pkgs, ... }:

{
  fonts.packages = with pkgs; [
    jetbrains-mono
    nerd-font-patcher
    (nerdfonts.override {
      fonts = [
        "FiraCode"
        "JetBrainsMono"
      ];
    })
  ];
}
