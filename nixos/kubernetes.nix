{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    k9s
    kubernetes-helm
    kubectl
    kubectx
    istioctl
    (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
  ];
}
