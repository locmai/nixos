{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    code-cursor
    fish
    starship
  ];
}
