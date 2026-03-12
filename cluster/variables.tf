variable "region" {
  default = "us-east-1"
}

variable "assume_role" {
  type = object({
    role_arn    = string,
    external_id = string
  })

  default = {
    role_arn    = "arn:aws:iam::760023434898:role/terraform-role"
    external_id = "de32345c-2ca9-43e9-b7b1-603db7316339"
  }
}

variable "tags" {
  type = object({
    Project     = string
    Environment = string
  })

  default = {
    Project     = "eks-express",
    Environment = "production"
  }
}

variable "eks_cluster" {
  type = object({
    name = string
    role_name = string
    version = string 
    enabled_cluster_log_types = list(string)
    access_config = object({
      authentication_mode = string 
    })
  })

  default = {
    name = "eks_express-cluster"
    role_name = "eks-express-cluster-role"
    version = "1.32"
    enabled_cluster_log_types = [ "api", "audit", "authenticator", "controllerManager", "scheduler" ]
    access_config = {
      authentication_mode = "API_AND_CONFIG_MAP"
    }
  }
}