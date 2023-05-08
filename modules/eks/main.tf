resource "aws_eks_cluster" "eks_cluster" {
  name     = var.cluster-name
  role_arn = aws_iam_role.eks_cluster_role.arn

  vpc_config {
    security_group_ids = [aws_security_group.eks_cluster_sg.id]
    subnet_ids         = flatten([var.private_subnets_eks_ids, var.public_subnets_ids])
  }

  depends_on = [
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSClusterPolicy,
    aws_iam_role_policy_attachment.eks_cluster_AmazonEKSVPCResourceController,
  ]
}

resource "aws_iam_role" "eks_cluster_role" {
  name = "eks_cluster_role"
  assume_role_policy = file("policies/assume_eks_cluster_role_policy.json")
}

resource "aws_iam_role_policy_attachment" "eks_cluster_AmazonEKSClusterPolicy" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
  role       = aws_iam_role.eks_cluster_role.name
}

resource "aws_iam_role_policy_attachment" "eks_cluster_AmazonEKSVPCResourceController" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSVPCResourceController"
  role       = aws_iam_role.eks_cluster_role.name
}

resource "aws_security_group" "eks_cluster_sg" {
  name        = "eks_cluster_sg"
  description = "Cluster communication with worker nodes"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = var.private_subnets_rds_cidr
  }

    ingress {
    from_port   = 9443
    to_port     = 9443
    protocol    = "tcp"
    cidr_blocks = var.private_subnets_rds_cidr
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks_cluster_sg",
    "kubernetes.io/cluster/${var.cluster-name}" = "shared"
  }
}