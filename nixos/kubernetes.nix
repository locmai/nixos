{ pkgs, ...}:

{
  environment.systemPackages = with pkgs; [
    kubernetes-helm
    kubectl
    kubectx
    istioctl
    (google-cloud-sdk.withExtraComponents [google-cloud-sdk.components.gke-gcloud-auth-plugin])
  ];
}
