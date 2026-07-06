{ pkgs, ... }: {
  # Aylur's GTK Shell (AGS v2) — scaffolding/bundler CLI for building GTK
  # widgets & bars. Scratch space for widget development; not wired into the
  # running Hyprland setup (waybar is still the live bar).
  environment.systemPackages = with pkgs; [
    ags
  ];
}
