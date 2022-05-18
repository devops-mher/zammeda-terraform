variable "project_id" {
  type        = string
  description = "Google cloud project id"
}

variable "network_name" {
  type        = string
  description = "Google cloud VPC network name"
}

variable "routing_mode" {
  type        = string
  description = "Google cloud VPC network dynamic routing mode"
}

variable "subnets" {
  type        = list(map(string))
  description = "The list of subnets being created"
}

variable "rules" {
  description = "List of custom rule definitions (refer to variables file for syntax)."
  default     = []
  type = list(object({
    name                    = string
    description             = string
    direction               = string
    priority                = number
    ranges                  = list(string)
    source_tags             = list(string)
    source_service_accounts = list(string)
    target_tags             = list(string)
    target_service_accounts = list(string)
    allow = list(object({
      protocol = string
      ports    = list(string)
    }))
    deny = list(object({
      protocol = string
      ports    = list(string)
    }))
    log_config = object({
      metadata = string
    })
  }))
}

