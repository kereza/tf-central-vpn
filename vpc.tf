module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.0.0"

  name = var.env
  cidr = var.cidr

  azs             = var.azs
  private_subnets = var.private_subnets
  //public_subnets   = local.public_subnets
  //database_subnets = local.database_subnets

  enable_dns_hostnames = true
  enable_nat_gateway   = false
  //single_nat_gateway               = local.single_nat_gateway
  enable_dhcp_options              = true
  dhcp_options_domain_name         = "ec2.internal"
  dhcp_options_domain_name_servers = ["AmazonProvidedDNS"]

  tags = { terraform = "true", environment = var.env }
}