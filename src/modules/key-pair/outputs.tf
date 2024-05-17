output "key_name" {
  description = "The name of the key pair"
  value       = aws_key_pair.ec2_key_pair.key_name
}