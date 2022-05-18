
module "vpc" {
  source = "./modules/vpc"

  project_id   = local.envs[var.env].project
  network_name = local.envs[var.env].network_name
  routing_mode = local.envs[var.env].routing_mode
  subnets      = local.envs[var.env].subnets
  rules        = local.envs[var.env].rules
}
