{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    terraform
    terraform-plugin-docs
  ];
}
