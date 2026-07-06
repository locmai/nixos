# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal NixOS + Hyprland daily-driver configuration for a single Lenovo ThinkPad
X1 (host: `x1carbon`, hostname: `nixos`, `x86_64-linux`). Flake-based, tracking
`nixos-26.05`.

## Commands

Run from the repo root (the `Makefile` wraps the flake path for you):

- `make` — rebuild and switch the system: `sudo nixos-rebuild --flake './nixos/#x1carbon' switch`
- `make update` — `nix flake update` the inputs (`nixos/flake.lock`)
- `make verify-nix-store` — verify/repair the Nix store
- `nix fmt ./nixos` — format Nix files (formatter is `nixfmt-rfc-style`, declared in `flake.nix`)

To iterate on a change without committing to it: `sudo nixos-rebuild --flake './nixos/#x1carbon' test`.

## Architecture

Two independent halves that are **not** wired together — this is the most important
thing to understand:

1. **`nixos/`** — the declarative system. `flake.nix` defines the single
   `nixosConfigurations.x1carbon` and lists every module explicitly in its `modules`
   array (there is no auto-import; a new `.nix` file does nothing until added there).
   `configuration.nix` is the base module; the rest are split by concern
   (`bootloader.nix`, `graphics.nix`, `hyprland.nix`, `kubernetes.nix`,
   `virtualisation.nix`, `theme.nix`, etc.). `hardware-configuration.nix` is
   machine-generated. `experimentals/` (`azure.nix`, `playground.nix`) is scratch
   space that may be deleted — don't treat it as stable.

2. **`home/locmai/`** — dotfiles (Hyprland, Waybar, Kitty, nvim, rofi, yazi, zsh,
   etc.). Despite `home-manager.nixosModules.home-manager` being imported in the
   flake, these dotfiles are **not** managed declaratively by home-manager. They are
   plain files synced by hand with the Makefile:
   - `make sync-local` — copy repo dotfiles → live `~/.config` (apply)
   - `make sync-remote` — copy live `~/.config`/`~/.zshrc`/etc. → repo (capture)
   The `DIRS` variable in the `Makefile` is the authoritative list of directories
   `sync-remote` pulls back. Editing files under `home/` does not affect the running
   system until `make sync-local`.

## Working notes

- When adding a system feature, put it in an appropriately-named module under
  `nixos/` and register it in `flake.nix`'s `modules` list.
- `specialArgs` passes `hyprland-qtutils` into modules; add flake inputs there if a
  module needs them.
