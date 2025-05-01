{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
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
    uv

    # Go
    go
    gotools

    # Terraform/HCL
    hclfmt

    # NodeJS
    nodejs_23
    nodePackages_latest.webpack
    nodePackages_latest.webpack-cli
  ];
}
