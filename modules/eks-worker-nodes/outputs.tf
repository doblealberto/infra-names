output worker-nodes-role-name  {
    value = aws_iam_role.eks_node_group_role.name
}