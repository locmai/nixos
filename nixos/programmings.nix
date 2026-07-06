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
    nil

    # Python
    python3
    uv
    ruff

    # Go
    go
    gotools
    gopls
    delve

    # Terraform/HCL
    hclfmt
    terraform-ls

    # NodeJS
    nodejs
    typescript-language-server
    vscode-langservers-extracted
    yaml-language-server
    bash-language-server
    emmet-language-server

    # Vue
    vue-language-server

    # Lua
    lua-language-server
    stylua

    # AI/ML
    ollama

    # Hyprland
    hyprls
    hyprlang

    # AI agents
    claude-code

    # Misc
    marksman
    markdown-oxide
    zls
    jsonfmt
    buf
    cmake-language-server
    docker-compose-language-service
    step-cli

    # Graphics/GL libs
    libgbm
    libGL
    libx11
    libxcursor
    libxrandr
    virtualglLib
    steam-run
  ];
}
