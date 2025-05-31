{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # vim
    neovim
    git
    tree-sitter

    # Rust
    cargo
    cargo-generate
    rustc
    rust-analyzer
    rustfmt
    rustup

    # Nix
    nixfmt-rfc-style

    # Python
    python3
    uv

    # Go
    go
    gotools

    # Terraform/HCL
    hclfmt

    # NodeJS
    nodejs
    nodePackages_latest.webpack
    nodePackages_latest.webpack-cli

    ollama
  ];
}
