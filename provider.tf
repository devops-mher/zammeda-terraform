provider "google" {
  project = local.envs[var.env].project
  region  = local.envs[var.env].region
  zone    = local.envs[var.env].zone

}

terraform {
  backend "gcs" {}
}
