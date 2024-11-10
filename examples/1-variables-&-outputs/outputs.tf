# Output examples
output "vpc_id" {
  value       = aws_vpc.main.id
  description = "The ID of the VPC"
}

output "public_subnet_id" {
  value       = aws_subnet.public.id
  description = "Public subnet ID"
}