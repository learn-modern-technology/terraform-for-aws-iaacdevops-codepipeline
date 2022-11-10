resource "aws_launch_template" "base_launch_template" {
  name_prefix = "${local.name}-"
  ##name = "base-launch-template"
  description = "Base Launch template"
  image_id = data.aws_ami.ami-datasource-amazonlinux2.id
  instance_type = var.instance_type

  vpc_security_group_ids = [ module.private_sg.security_group_id ]
  key_name = var.instance_key
  user_data = filebase64("${path.module}/user_data_webapp1.sh")
  ebs_optimized = false 
  ##default_version = 1
  update_default_version = true 
  block_device_mappings {
    device_name = "/dev/xvda"
    ebs {
      volume_size = 8              
      delete_on_termination = true
      volume_type = "gp2"
      encrypted = false
 
    }
   }
  monitoring {
    enabled = true
  }   
  tag_specifications {
    resource_type = "instance"
    tags = {
      Name = local.name
    }
  }  
  
}
