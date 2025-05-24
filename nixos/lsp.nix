{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Nix
    alejandra

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
    gopls
    jsonfmt
    delve
    emmet-language-server
    buf
    cmake-language-server
    docker-compose-language-service
    vscode-extensions.vadimcn.vscode-lldb
    slint-lsp
    terraform-ls
    ansible-language-server
    helix-gpt
  ];
}
