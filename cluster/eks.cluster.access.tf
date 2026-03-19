resource "aws_eks_access_entry" "iamadmin" {
  cluster_name  = aws_eks_cluster.this.name
  principal_arn = local.eks_access_user_arn
  type          = "STANDARD"
}

resource "aws_eks_access_policy_association" "iamadmin" {
  cluster_name  = aws_eks_cluster.this.name
  policy_arn    = "arn:aws:eks::aws:cluster-access-policy/AmazonEKSClusterAdminPolicy"
  principal_arn = local.eks_access_user_arn

  access_scope {
    type = "cluster"
  }
}
