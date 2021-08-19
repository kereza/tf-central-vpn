/*
For cross-account (requester's AWS account differs from the accepter's AWS account) or inter-region VPC Peering Connections
use the aws_vpc_peering_connection resource to manage the requester's side of the connection and use the aws_vpc_peering_connection_accepter resource to manage the accepter's side of the connection.
*/

resource "aws_vpc_peering_connection" "keri_org" {
  for_each      = var.remote_vpcs
  peer_owner_id = var.account_id
  peer_vpc_id   = each.value.vpc_id
  vpc_id        = module.vpc.vpc_id
  auto_accept   = true

  accepter {
    allow_remote_vpc_dns_resolution = true
  }

  requester {
    allow_remote_vpc_dns_resolution = true
  }
}