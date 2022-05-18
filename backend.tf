resource "google_compute_backend_bucket" "image_backend" {
  name        = local.envs[var.env].google_compute_backend_bucket_name
  description = local.envs[var.env].google_compute_backend_bucket_description
  bucket_name = google_storage_bucket.image_bucket.name
  enable_cdn  = local.envs[var.env].google_compute_backend_bucket_cdn
}

resource "google_storage_bucket" "image_bucket" {
  name     = local.envs[var.env].google_storage_bucket_name
  location = local.envs[var.env].google_storage_bucket_location
}
