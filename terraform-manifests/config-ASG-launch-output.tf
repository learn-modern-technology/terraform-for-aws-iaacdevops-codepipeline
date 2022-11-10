output "launch_template_id" {
  description = "ID of the Launch Template that we created"
  value = aws_launch_template.base_launch_template.id
}
output "launch_template_version" {
  description = "Version of the Launch Template that we used"
  value = aws_launch_template.base_launch_template.latest_version
}

output "auto_scaling_group_id" {
  description = "ID of the auto scaling group"
  value = aws_autoscaling_group.webapp_auto_scaling_group.id
}

output "auto_scaling_group_name" {
  description = "Name of the auto scaling group"
  value = aws_autoscaling_group.webapp_auto_scaling_group.name
}
output "auto_scaling_group_arn" {
  description = "ARN of the auto scaling group"
  value = aws_autoscaling_group.webapp_auto_scaling_group.arn
}