locals {
  owners = var.application_owner
  environment = var.environment
  name = "${var.application_owner}-${var.environment}"
  common_tags = {
    owners = local.owners
    environment = local.environment
  }

  asg_tags = [
    {
      key                 = "Project"
      value               = "ASG Using Launch Template"
      propagate_at_launch = true
    },
    {
      key                 = "Deployment"
      value               = "CodePipeline"
      propagate_at_launch = true
    },
  ]
}