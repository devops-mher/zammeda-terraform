

variable "subnetwork" {
  description = "The name of the subnetwork to deploy instances into"
}

variable "network" {
  description = "The name or self_link of the network to attach this interface to. Either network or subnetwork must be provided. If network isn't provided it will be inferred from the subnetwor"
}

variable "tags" {
  type        = list(string)
  description = "Network tags, provided as a list"
  default     = []
}

variable "template_file" {
  type        = string
  description = "Network tags, provided as a list"
  default     = ""
}

variable "instance_name" {
  description = "The desired name to assign to the deployed instance"
  default     = "hello-world-container-vm"
}

variable "domain_name" {
  description = "The desired name to assign to the deployed instance"
  default     = "hello-world-container-vm"
}

variable "zone" {
  description = "The GCP zone to deploy instances into"
  type        = string
}
