provider "kind" {}

resource "kind_cluster" "voting_app" {
  name            = "voting-app"
  wait_for_ready  = true
  kubeconfig_path = "${path.module}/kubeconfig"
}
