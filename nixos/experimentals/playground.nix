{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    code-cursor
    starship
    fish
    zsh
  ];
}
