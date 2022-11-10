module "alb_sg" {
  source  = "terraform-aws-modules/security-group/aws"
  version = "4.13.1"
  
  name = "${local.name}-elb-sg"
  description = "Security Group with HTTP open for Internet, egress ports are all world open"
  vpc_id = module.vpc.vpc_id

  ## Ingress Rules & CIDR Blocks 
  ingress_rules = ["http-80-tcp","https-443-tcp"]
  ingress_cidr_blocks = ["0.0.0.0/0"]

  ## Egress Rules
  egress_rules = ["all-all"]

  # Open to CIDRs blocks (rule or from_port+to_port+protocol+description)
  ingress_with_cidr_blocks = [
    {
        from_port = 81
        to_port = 81
        protocol = 6
        description = "Allow port 81 from Internet"
        cidr_blocks = "0.0.0.0/0"
    },
  ]
  tags = local.common_tags
}