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

resource "aws_route" "private_table_1" {
  for_each                  = var.remote_vpcs
  route_table_id            = module.vpc.private_route_table_ids[0]
  destination_cidr_block    = each.value.cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.keri_org[each.key].id
  depends_on                = [module.vpc.private_route_table_ids]

  timeouts {
    create = "5m"
    delete = "5m"
  }
}

resource "aws_route" "private_table_2" {
  for_each                  = var.remote_vpcs
  route_table_id            = module.vpc.private_route_table_ids[1]
  destination_cidr_block    = each.value.cidr
  vpc_peering_connection_id = aws_vpc_peering_connection.keri_org[each.key].id
  depends_on                = [module.vpc.private_route_table_ids]

  timeouts {
    create = "5m"
    delete = "5m"
  }
}

