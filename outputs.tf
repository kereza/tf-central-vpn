output "azs" {
  description = "List of availability zones that we use"
  value       = var.azs
}
output "cidr" {
  description = "VPC CIDR"
  value       = var.cidr
}
output "vpc_id" {
  description = "Export VPC ID"
  value       = module.vpc.vpc_id
}
output "env" {
  description = "Export environment name"
  value       = var.env
}

output "vpn_cidr_block" {
  description = "The CIDR range for clients connected to the VPN"
  value       = var.vpn_cidr_block
}

output "sg_vpn_id" {
  description = "SG for the VPN"
  value       = module.sg_vpn.this_security_group_id
}

/*
SSH
*/
output "ssh_deafult_key" {
  description = "Default SSH key for the stage"
  value       = aws_key_pair.default.key_name
}

/*
  SUBNETS
  */
output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc.private_subnets
}

/*
VPN
*/
output "client_key_pem" {
  description = "Materia for the client key"
  value       = tls_private_key.client_side_vpn.private_key_pem
}

output "client_cert_pem" {
  description = "Material for the cleint cert"
  value       = tls_locally_signed_cert.client_side_vpn.cert_pem
}