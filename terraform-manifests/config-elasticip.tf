resource "aws_eip" "elastic_ip" {
    depends_on = [
      module.ec2_public,
      module.vpc
    ]

    vpc = true
    instance = module.ec2_public.id
    tags = local.common_tags
  
}