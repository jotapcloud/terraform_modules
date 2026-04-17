output "default_sg_id" {
  value = aws_vpc.main.default_security_group_id
}

output "id" {
  value = aws_vpc.main.id
}

output "ig-id" {
  value = aws_internet_gateway.ig.id
}

output "cgw_ids" {
  description = "List of IDs of Customer Gateway"
  value       = [for k, v in aws_customer_gateway.this : v.id]
}