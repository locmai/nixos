{pkgs, ...}: {
  environment.systemPackages = with pkgs; [
    k9s
    kind
    kubernetes-helm
    kubectl
    kubectx
    istioctl
    operator-sdk

    terragrunt
    opentofu
    terraform

    # Google Cloud SDK
    (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])

    # Azure CLI
    kubelogin
    azure-cli
  ];
}
