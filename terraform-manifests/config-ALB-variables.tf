variable "lb_hlth_chck_interval" {
    description = "Set the interval value to health check instance availability"
    default = 30
  
}

variable "lb_unhlthy_threshold" {
    description = "Set the interval value to health check instance availability"
    default = 2
  
}

variable "lb_hlthy_threshold" {
    description = "Set the interval value to health check instance availability"
    default = 2
  
}

variable "lb_timeout" {
    description = "Set the interval value to health check instance availability"
    default = 5
  
}

variable "lb_type"{
    description = "Set the Load Balancer Type"
    type = string
    default = "application"
}