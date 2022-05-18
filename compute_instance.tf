module "compute_instance" {
  for_each = local.envs[var.env].compute_instance
  source   = "./modules/compute_instance"

  zone          = local.envs[var.env].zone
  instance_name = each.value.instance_name
  network       = each.value.network
  subnetwork    = each.value.subnetwork
  tags          = each.value.tags
  template_file = each.value.template_file
}
