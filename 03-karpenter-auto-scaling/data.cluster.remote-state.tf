data "terraform_remote_state" "cluster_stack" {
  backend = "s3"

  config = {
    bucket         = "eks-express-terraform-state-files"
    key            = "karpenter-auto-scaling/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "eks-express-terraform-state-locking"
  }
}