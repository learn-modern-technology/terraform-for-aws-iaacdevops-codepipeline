# EC2 Complete
output "public_ec2_id" {
  description = "The ID of the instance"
  value       =  module.ec2_public.id
}

output "public_ec2_public_ip" {
  description = "The public IP address assigned to the instance, if applicable. NOTE: If you are using an aws_eip with your instance, you should refer to the EIP's address directly and not use `public_ip` as this field will change after the EIP is attached"
  value       = module.ec2_public.public_ip
}