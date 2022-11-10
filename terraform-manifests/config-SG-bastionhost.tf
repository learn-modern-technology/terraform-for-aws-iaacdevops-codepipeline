module "public_bastion_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.1"

  name = "${local.name}-Bastion-SG"
  description = "Security group for Bastion host"
  vpc_id = module.vpc.vpc_id

  ## Ingress Rules & CIDR Blocks
  ingress_rules       = ["ssh-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]
  
  ## Egress Rule - all-all open
  egress_rules        = ["all-all"]
  tags = local.common_tags
}