data "aws_route53_zone" "mydomain_zone" {
    name = "learnawswithss.com"
}

output "mydomain_zoneid" {
  description = "The Hosted Zone id of the desired Hosted Zone"
  value = data.aws_route53_zone.mydomain_zone.zone_id
}

output "mydomain_name" {
  description = "The Hosted Zone name of the desired Hosted Zone"
  value = data.aws_route53_zone.mydomain_zone.name
}