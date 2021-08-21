resource "aws_ec2_client_vpn_endpoint" "client_vpn" {
  description            = "kerezov-clientvpn-${var.env}"
  server_certificate_arn = aws_acm_certificate.server_side_vpn.arn
  client_cidr_block      = var.vpn_cidr_block
  dns_servers            = ["8.8.8.8", "8.8.4.4"]
  transport_protocol     = "tcp"
  split_tunnel           = "true"

  authentication_options {
    type                       = "certificate-authentication"
    root_certificate_chain_arn = aws_acm_certificate.client_side_vpn.arn
  }

  connection_log_options {
    enabled = false
  }
  tags = { Name = "kerezov-clientvpn-${var.env}" }
}

# resource "aws_ec2_client_vpn_network_association" "client_vpn" {
#   count                  = length(module.vpc.private_subnets)
#   client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.client_vpn.id
#   subnet_id              = module.vpc.private_subnets[count.index]
#   security_groups        = [module.sg_vpn.this_security_group_id]
# }

# resource "aws_ec2_client_vpn_authorization_rule" "client_vpn" {
#   for_each               = toset(concat([var.cidr], values(var.remote_vpcs)[*]["cidr"]))
#   client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.client_vpn.id
#   target_network_cidr    = each.key
#   authorize_all_groups   = true
# }

# resource "aws_ec2_client_vpn_route" "routes_subnet_1" {
#   for_each               = toset(values(var.remote_vpcs)[*]["cidr"])
#   client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.client_vpn.id
#   destination_cidr_block = each.key
#   target_vpc_subnet_id   = aws_ec2_client_vpn_network_association.client_vpn[0].subnet_id
# }

# resource "aws_ec2_client_vpn_route" "routes_subnet_2" {
#   for_each               = toset(values(var.remote_vpcs)[*]["cidr"])
#   client_vpn_endpoint_id = aws_ec2_client_vpn_endpoint.client_vpn.id
#   destination_cidr_block = each.key
#   target_vpc_subnet_id   = aws_ec2_client_vpn_network_association.client_vpn[1].subnet_id
# }