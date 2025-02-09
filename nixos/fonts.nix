{pkgs, ...}: {
  fonts.packages = with pkgs; [
    jetbrains-mono
    (nerdfonts.override {
      fonts = [
        "FiraCode"
      ];
    })
    nerd-font-patcher
  ];
}
