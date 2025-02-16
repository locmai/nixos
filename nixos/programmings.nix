{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Rust
    cargo
    cargo-generate
    rustc
    rust-analyzer
    rustfmt

    # Nix
    nixfmt-rfc-style

    # Python
    uv

    # Go
    gotools

    # Terraform/HCL
    hclfmt

    # NodeJS
    nodejs_23
  ];
}
