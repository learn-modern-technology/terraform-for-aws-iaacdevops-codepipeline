variable "instance_type" {
    description = "EC2 Instance Types"
    type = string
    ##default = "t2.micro"  
}

variable "instance_key" {
  description = "EC2 Instance Key Pair"
  type = string
  ##default = "ec2_key_pair"
}

variable "instance_count" {
    description = "EC2 Instance Counts"
    type = number
    default = 1
}