variable "aws_region" {
  description = "AWS Region to execute the Terraform"
  type = string
  ##default = "us-east-1"
}

variable "aws_profile" {
    description = "AWS Credentials Profile to be used for executing Terraform Scripts"
    default = "learnssaws" 
}

variable "environment" {
  description = "Enivronment variable used as prefix"
  type = string
  default = "dev"  
}

variable "application_owner" {
  description = "Owner of Application"
  type = string
  default = "ssingh"
  
}
