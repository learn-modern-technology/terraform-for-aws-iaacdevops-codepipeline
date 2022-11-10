module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.16.0"        ## For public repository always use the = operator
  ## version = "~> 3.0"
  
  name = "${local.name}-${var.vpc_name}"
  cidr = var.vpc_cidr_block         

  azs                 = var.vpc_availability_zones
  private_subnets     = var.vpc_private_subnets
  public_subnets      = var.vpc_public_subnets

  create_database_subnet_group = var.vpc_create_database_subnet_group
  create_database_subnet_route_table = var.vpc_create_database_subnet_route_table
  database_subnets    = var.vpc_database_subnets

  ### by default these values are false. if you want to set it to true set the value here
  ## create_database_internet_gateway_route = true
  ## create_database_nat_gateway_route = true

  ## To set NAT Gateway outbound communications
  enable_nat_gateway = var.vpc_enable_nat_gateway
  single_nat_gateway = var.vpc_single_nat_gateway

  ## To set VPC DNS Parameters
  enable_dns_hostnames = true
  enable_dns_support = true

  database_subnet_tags = {
    Type = "database_subnets"
  }

  public_subnet_tags = {
    Type = "public_subnets"
  }

  private_subnet_tags = {
    Type = "private_subnets"
  }

  tags = local.common_tags
  vpc_tags = local.common_tags

}