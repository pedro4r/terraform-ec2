output "public_subnet_1_id" {
  value = aws_subnet.public_subnet_1.id
  sensitive = false
  description = "The ID of the public subnet 1"
}

output "public_subnet_2_id" {
  value = aws_subnet.public_subnet_2.id
  sensitive = false
  description = "The ID of the public subnet 2"
}

output "public_subnet_3_id" {
  value = aws_subnet.public_subnet_3.id
  sensitive = false
  description = "The ID of the public subnet 3"
}

