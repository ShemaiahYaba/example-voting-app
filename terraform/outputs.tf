output "kubeconfig_path" {
  description = "Path to the generated kubeconfig. The file is gitignored."
  value       = kind_cluster.voting_app.kubeconfig_path
}

output "kubectl_context" {
  description = "kubectl context created for this cluster."
  value       = "kind-${kind_cluster.voting_app.name}"
}
