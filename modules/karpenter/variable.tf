variable "cluster_endpoint" {
  type        = string
  description = "The cluster endpoint of the EKS cluster"
}

variable "cluster_ca_certificate" {
  type        = string
  description = "The cluster CA certificate of the EKS cluster"
}

variable "cluster_id" {
  type        = string
  description = "The cluster ID of the EKS cluster"
}