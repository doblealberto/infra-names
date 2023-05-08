locals {
  availability_zones = ["${var.aws_region}a", "${var.aws_region}b"]
}

module "networking" {
  source = "./modules/networking"

  availability_zones = local.availability_zones
}

module "eks" {
  source = "./modules/eks"

  private_subnets_eks_ids = module.networking.private_subnets_eks_ids
  vpc_id                  = module.networking.vpc_id
  public_subnets_ids      = module.networking.public_subnets_ids

}

module "eks_worker_nodes" {
  source = "./modules/eks-worker-nodes"

  aws_eks_cluster_name    = module.eks.aws_eks_cluster_name
  private_subnets_eks_ids = module.networking.private_subnets_eks_ids
}


module "rds" {
  source = "./modules/database"

  vpc_id               = module.networking.vpc_id
  db_subnet_group_name = module.networking.aws_rds_subnet_group_id
}

module "karpenter" {
  source = "./modules/karpenter"
  cluster_endpoint =
  cluster_ca_certificate = 
  cluster_id =
}



