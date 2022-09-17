output "subnets" {
  value       = [aws_subnet.public.id]
  description = "Print subnet ids."
}
