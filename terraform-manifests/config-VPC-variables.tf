# VPC Input Variables
# These variables will be loaded using auto.tfvars script

# VPC Name
variable "vpc_name" {
  description = "Name of the VPC to be created"
  type = string
}

# VPC CIDR Block
variable "vpc_cidr_block" {
    description = "CIDR Block of the VPC that needs to be created"
    type = string  
}

# VPC Availability Zones
variable "vpc_availability_zones" {
    description = "VPC Availability zones"
    type = list(string)  
}

# VPC Public Subnets
variable "vpc_public_subnets" {
    description = "CIDR of Public subnets in the VPC"
    type = list(string)  
}

# VPC Private Subnets
variable "vpc_private_subnets" {
    description = "CIDR of Private subnets in the VPC"
    type = list(string)  
}

# VPC Database Subnets
variable "vpc_database_subnets" {
    description = "CIDR of DB subnets in the VPC"
    type = list(string)  
}

# VPC Create Database Subnet Group (True / False)
variable "vpc_create_database_subnet_group" {
  description = "VPC Create Database Subnet Group"
  type = bool
}

# VPC Create Database Subnet Route Table (True or False)
variable "vpc_create_database_subnet_route_table" {
    description = "VPC Create Database Subnet Route Table"
    type = bool  
}

# VPC Enable NAT Gateway (True or False) 
variable "vpc_enable_nat_gateway" {
  description = "Enable NAT Gateways for Private Subnets Outbound Communication"
  type = bool  
}

# VPC Single NAT Gateway (True or False)
variable "vpc_single_nat_gateway" {
  description = "Enable only single NAT Gateway in one Availability Zone to save costs during our demos"
  type = bool
}

variable "vpc_enable_dns_hostnames" {
  description = "Enable enable_dns_hostnames for vpc"
  type = bool
}

variable "enable_dns_support" {
  description = "Enable enable_dns_support for vpc"
  type = bool  
}