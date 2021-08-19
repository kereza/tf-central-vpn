module "sg_vpn" {
  source      = "terraform-aws-modules/security-group/aws"
  version     = "3.17.0"
  name        = "SG for the VPN connection ${var.env}"
  description = "Security Group for the VPN"
  vpc_id      = module.vpc.vpc_id

  ingress_cidr_blocks = ["0.0.0.0/0"]
  ingress_rules       = ["all-all"]

  egress_cidr_blocks = ["0.0.0.0/0"]
  egress_rules       = ["all-all"]

  tags = {
    Name = "VPN-${var.env}"
  }
}