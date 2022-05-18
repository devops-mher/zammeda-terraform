module "vpc" {
  source  = "terraform-google-modules/network/google"
  version = "~> 4.0"

  project_id   = var.project_id
  network_name = var.network_name
  routing_mode = var.routing_mode
  subnets      = var.subnets

}

module "firewall_rules" {
  source = "terraform-google-modules/network/google//modules/firewall-rules"

  project_id   = var.project_id
  network_name = module.vpc.network_name
  rules        = var.rules
}
