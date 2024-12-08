{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Rust
    cargo
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
  ];
}
