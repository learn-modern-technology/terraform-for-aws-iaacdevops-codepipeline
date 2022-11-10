module "private_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.1"
  
  name = "${local.name}-private-sg"
  description = "HTTP and SSH Security Group for private instances"
  vpc_id = module.vpc.vpc_id

  ## Ingress Rules & CIDR Blocks 
  ingress_rules = ["ssh-tcp","http-80-tcp","https-443-tcp"]
  ingress_cidr_blocks = [module.vpc.vpc_cidr_block]

  ## Egress Rules
  egress_rules = ["all-all"]
  tags = local.common_tags
}