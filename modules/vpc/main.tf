# VPC - This VPC will be the same for both environment PRD and HML
resource "aws_vpc" "main" {
  cidr_block           = var.vpc_cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = true
  enable_dns_support   = true

  tags = merge(
    { Name = "vpc-${var.project_name}-${var.env}" },
    var.tags
  )
}


# IGW - This will be used to grant access to the rest of the VPC to the internet
resource "aws_internet_gateway" "ig" {
  vpc_id = aws_vpc.main.id

  tags = merge(
    { Name = "ig-${var.project_name}-${var.env}" },
    var.tags
  )
}

################################################################################
# Customer Gateways
################################################################################

resource "aws_customer_gateway" "this" {
  for_each = var.customer_gateways

  bgp_asn     = each.value["bgp_asn"]
  ip_address  = each.value["ip_address"]
  device_name = lookup(each.value, "device_name", null)
  type        = "ipsec.1"

  tags = merge(
    { Name = each.value["name"] },
    var.tags
  )

  lifecycle {
    create_before_destroy = true
  }
}