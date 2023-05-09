# variable "helm_provider" {
#   type = any
#   description = "provider for the helm karpenter chart"
# }
variable "cluster_endpoint" {
  type = string
}

variable "token" {
  type = string
}

variable "cluster_id" {
  type = string
}
variable "oidc_provider_url" {
  type = string
}

variable "oidc_provider_arn" {
  type = string
}

variable "worker-nodes-role-name" {
  type = string
}

variable "cluster_ca_certificate" {
  type = string
}