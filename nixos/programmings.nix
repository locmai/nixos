{ pkgs, ... }: {
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
    nixfmt

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
    vscode-langservers-extracted
    yaml-language-server
    bash-language-server

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

    # AI agents
    claude-code

    step-cli
    mesa
    libgbm
    libGL
    libx11
    libxcursor
    libxrandr
    virtualglLib
    steam-run
  ];
}
