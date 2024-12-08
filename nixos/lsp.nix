{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Nix
    alejandra

    # Python
    ruff-lsp

    # NodeJS
    nodePackages_latest.nodemon
    nodePackages_latest.typescript
    nodePackages_latest.typescript-language-server
    nodePackages_latest.vscode-langservers-extracted
    nodePackages_latest.yaml-language-server
    nodePackages_latest.dockerfile-language-server-nodejs
    nodePackages_latest.bash-language-server
    nodePackages_latest.graphql-language-service-cli

    # Vue
    vue-language-server

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
