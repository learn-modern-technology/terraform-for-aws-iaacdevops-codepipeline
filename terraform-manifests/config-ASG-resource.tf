resource "aws_autoscaling_group" "webapp_auto_scaling_group" {
  name_prefix = "${local.name}-"
  ##name = "Autoscaling-Webapp"
  max_size = 10
  min_size = 2
  desired_capacity = 2
  health_check_grace_period  = 100
  health_check_type = "EC2"
  force_delete = true
  vpc_zone_identifier = module.vpc.private_subnets
  target_group_arns = module.alb.target_group_arns

  launch_template {
    id = aws_launch_template.base_launch_template.id
    version = aws_launch_template.base_launch_template.latest_version
  }

  termination_policies = [ "OldestInstance", "OldestLaunchConfiguration", "ClosestToNextInstanceHour", "OldestLaunchTemplate"]
  
  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = [ "desired_capacity" ]
  }

    tag {
        key                 = "Owners"
        value               = "Web-Team"
        propagate_at_launch = true
    }
}

## #define autoscaling configuration policy
## resource "aws_autoscaling_policy" "cpu_policy" {
##     name = "cpu_policy"
##     autoscaling_group_name = aws_autoscaling_group.webapp_asg.name
##     adjustment_type = "ChangeInCapacity"
##     scaling_adjustment = 1
##     cooldown = 60
##     policy_type = "SimpleScaling"
## }
## 
## # define autoscaling policy  to scale down
## resource "aws_autoscaling_policy" "cpu_policy_scaledown" {
##    name = "cpu_policy_scaledown"
##    autoscaling_group_name = aws_autoscaling_group.webapp_asg.name
##    adjustment_type = "ChangeInCapacity"
##    scaling_adjustment = 1
##    cooldown = 60
##    policy_type = "SimpleScaling"
## }
