{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    # Azure CLI
    kubelogin
    azure-cli
  ];
}
