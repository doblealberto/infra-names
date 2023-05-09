output "aws_eks_cluster_name" {
  value = aws_eks_cluster.eks_cluster.name
}

output "cluster_endpoint" {
  value       = aws_eks_cluster.eks_cluster.endpoint
  description = "The endpoint for the EKS cluster"
}

output "cluster_ca_certificate" {
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
  description = "The certificate authority data for the EKS cluster"
  sensitive   = true
}

output "cluster_id" {
  value       = aws_eks_cluster.eks_cluster.id
  description = "The ID of the EKS cluster"
}

output "token" {
  value = data.aws_eks_cluster_auth.this.token
}

output "config_context" {
  value = aws_eks_cluster.eks_cluster.name
}

#############################
output "oidc_provider_url" {
  value = aws_iam_openid_connect_provider.eks.url
}

output "oidc_provider_arn" {
  value = aws_iam_openid_connect_provider.eks.arn
}