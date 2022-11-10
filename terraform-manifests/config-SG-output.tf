output "public_bastion_sg_id" {
  description = "The ID of the security group"
  value       = module.public_bastion_sg.security_group_id
}
output "public_bastion_sg_vpcid" {
    description = "The VPC Id"
    value = module.public_bastion_sg.security_group_vpc_id
}
output "public_bastion_sg_name" {
  description = "The name of the security group"
  value       = module.public_bastion_sg.security_group_name
}
output "private_instance_sg_id" {
  description = "The ID of the security group"
  value       = module.private_sg.security_group_id
}

output "alb_sg_id" {
  description = "The ID of the ALB Security Group ID"
  value = module.alb_sg.security_group_id  
}

output "private_instance_sg_vpcid" {
    description = "The VPC Id"
    value = module.private_sg.security_group_vpc_id
}
output "private_instance_sgname" {
   description = "The name of the security group"
   value       = module.private_sg.security_group_name
}