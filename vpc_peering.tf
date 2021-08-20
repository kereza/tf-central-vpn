resource "aws_route" "private_table_1" {
  for_each                  = var.remote_vpcs
  route_table_id            = module.vpc.private_route_table_ids[0]
  destination_cidr_block    = each.value.cidr
  vpc_peering_connection_id = each.value.peering_id
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
  vpc_peering_connection_id = each.value.peering_id
  depends_on                = [module.vpc.private_route_table_ids]

  timeouts {
    create = "5m"
    delete = "5m"
  }
}

