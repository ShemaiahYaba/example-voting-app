output "cluster_name" {
  description = "EKS cluster name."
  value       = aws_eks_cluster.voting_app.name
}

output "cluster_endpoint" {
  description = "EKS Kubernetes API endpoint."
  value       = aws_eks_cluster.voting_app.endpoint
}

output "update_kubeconfig" {
  description = "Command to point kubectl at this cluster."
  value       = "aws eks update-kubeconfig --region us-east-1 --name ${aws_eks_cluster.voting_app.name}"
}
