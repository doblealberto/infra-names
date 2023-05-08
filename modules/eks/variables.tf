variable "cluster-name" {
  type    = string
  default = "mlflow-cluster"
}

variable "private_subnets_eks_ids" {
  type        = list(string)
  description = "CIDR block for EKS Private Subnet"
}

variable "vpc_id" {
  type    = string
  description = "main vpc id "
}

variable "private_subnets_rds_cidr" {
  type        = list(any)
  description = "CIDR block for RDS Private Subnet"
  default     = ["10.0.3.0/24","10.0.4.0/24"]
}

variable "public_subnets_ids" {
    type        = list(any)
    description = "CIDR block for Public Subnets"
    default     = ["10.0.5.0/24"]

}

variable "kube-version" {
  type = string 
  default = "36.6.2"
}
