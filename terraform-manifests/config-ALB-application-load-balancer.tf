module "alb" {
  source  = "terraform-aws-modules/alb/aws"
  version = "8.1.0"

  ## Basics for creating Load Balancer
  name               = "${local.name}-alb"
  load_balancer_type = var.lb_type
  vpc_id             = module.vpc.vpc_id
  subnets            = [module.vpc.public_subnets[0], module.vpc.public_subnets[1]]
  security_groups    = [module.alb_sg.security_group_id]

  ### HTTP Listener - HTTP to HTTPS Redirect
  http_tcp_listeners = [
    {
      port               = 80
      protocol           = "HTTP"
      action_type = "redirect"
      redirect = {
        port = "443"
        protocol = "HTTPS"
        status_code = "HTTP_301"
      }
    }
  ]

  ### HTTPS Listener
  https_listeners = [
    {
      port               = 443
      protocol           = "HTTPS"
      certificate_arn    = var.acm_certificate_arn
      action_type     = "fixed-response"
      fixed_response = {
        content_type = "text/plain"
        message_body = "Fixed Static message - for Root Context"
        status_code  = "200"
      }
    }
  ]

  ## HTTPS Listener rule
  https_listener_rules = [
    # Rule-1: /webapp1* should go to App1 EC2 Instances
    {
      https_listener_index = 0
      actions = [
        {
          type = "forward"
          target_group_index = 0
        }
      ]
      conditions = [
        {
          path_patterns = ["/*"]
        }

      ]
    }
  ]

  ## Target Groups for WebApp1
  target_groups = [
    {
      name_prefix          = "app-01"
      backend_protocol     = "HTTP"
      backend_port         = 80
      target_type          = "instance"
      deregistration_delay = 10
      health_check = {
        enabled             = true
        interval            = 30
        path                = "/webapp1/index.html"
        port                = "traffic-port"
        healthy_threshold   = 3
        unhealthy_threshold = 3
        timeout             = 6
        protocol            = "HTTP"
        matcher             = "200-399"
      }
      protocol_version = "HTTP1"
    }
  ]

  tags = local.common_tags

}
