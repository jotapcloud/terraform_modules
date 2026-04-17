output "arn" {
  value = aws_subnet.main.arn
}

output "id" {
  value = aws_subnet.main.id
}

output "name" {
  value = aws_subnet.main.tags_all["Name"]
}

output "cidr_block" {
  value       = aws_subnet.main.cidr_block
  description = "CIDR blocks of the created private subnets."
}