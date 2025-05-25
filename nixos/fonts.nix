{pkgs, ...}: {
  fonts.packages = with pkgs; [
    nerd-font-patcher
    nerd-fonts.ubuntu-sans
  ];
}
