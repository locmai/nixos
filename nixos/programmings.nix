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
    gopls

    # Terraform/HCL
    hclfmt

    # NodeJS
    nodejs
    nodePackages_latest.webpack
    nodePackages_latest.webpack-cli

    # AI/ML
    ollama

    # Nix
    alejandra

    # Lua
    lua-language-server
    stylua

    # Python
    ruff

    # NodeJS
    typescript-language-server
    nodePackages_latest.vscode-langservers-extracted
    nodePackages_latest.yaml-language-server
    nodePackages_latest.dockerfile-language-server-nodejs
    nodePackages_latest.bash-language-server

    # Vue
    vue-language-server

    # Hyprland
    hyprls
    hyprlang

    # Misc
    marksman
    markdown-oxide
    nil
    zls
    jsonfmt
    delve
    emmet-language-server
    buf
    cmake-language-server
    docker-compose-language-service
    terraform-ls
    ansible-language-server
  ];
}
