locals {
  envs = {
    stage = {
      credentials = "./vernal-acrobat-344512.json"
      project     = "vernal-acrobat-344512"
      region      = "us-central1"
      zone        = "us-central1-a"

      google_compute_backend_bucket_name        = "image-backend-bucket-stage"
      google_compute_backend_bucket_description = "Contains beautiful images"
      google_compute_backend_bucket_cdn         = true
      google_storage_bucket_name                = "image-store-bucket-stage"
      google_storage_bucket_location            = "EU"

      network_name = "vpc-stage"
      routing_mode = "GLOBAL"
      subnets = [
        {
          subnet_name   = "mgmt-subnet-stage"
          subnet_ip     = "10.10.10.0/24"
          subnet_region = "us-central1"
          description   = "This subnet for bastion"
        },
        {
          subnet_name   = "app-subnet-stage"
          subnet_ip     = "10.10.20.0/24"
          subnet_region = "us-central1"
          description   = "This subnet has a description"
        }
      ]
      rules = [{
        name                    = "allow-ssh-ingress-stage"
        description             = null
        direction               = "INGRESS"
        priority                = null
        ranges                  = ["0.0.0.0/0"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = ["allow-ssh-ingress-stage"]
        target_service_accounts = null
        allow = [{
          protocol = "tcp"
          ports    = ["22"]
        }]
        deny = []
        log_config = {
          metadata = "INCLUDE_ALL_METADATA"
        }
        },
        {
          name                    = "all-from-bastion-stage"
          description             = null
          direction               = "INGRESS"
          priority                = null
          ranges                  = ["10.10.10.0/24"]
          source_tags             = null
          source_service_accounts = null
          target_tags             = null
          target_service_accounts = null
          allow = [{
            protocol = "tcp"
            ports    = []
          }]
          deny = []
          log_config = {
            metadata = "INCLUDE_ALL_METADATA"
          }
        },
        {
          name                    = "allow-https-ingress-stage"
          description             = null
          direction               = "INGRESS"
          priority                = null
          ranges                  = ["0.0.0.0/0"]
          source_tags             = null
          source_service_accounts = null
          target_tags             = ["allow-https-ingress-stage"]
          target_service_accounts = null
          allow = [{
            protocol = "tcp"
            ports    = ["443"]
          }]
          deny = []
          log_config = {
            metadata = "INCLUDE_ALL_METADATA"
          }
      }]
      compute_instance = {
        bastion-stage = {
          instance_name = "bastion-stage"
          network       = "vpc-stage"
          subnetwork    = "mgmt-subnet-stage"
          tags          = ["allow-ssh-ingress-stage"]
          template_file = "bastion.sh.tpl"
          domain_name   = "bastion-stage.com"

        }
        zammad-0-stage = {
          instance_name = "zammad-0-stage"
          network       = "vpc-stage"
          subnetwork    = "app-subnet-stage"
          tags          = ["allow-https-ingress-stage"]
          template_file = "app.sh.tpl"
          domain_name   = "zammad-0.com"

        }
      }
      tags = {
        Created_by  = "Terraform",
        Environment = "Stage",
        Product     = "Zammad"
      }
    }

    prod = {
      credentials = "./vernal-acrobat-344512.json"
      project     = "vernal-acrobat-344512"
      region      = "us-central1"
      zone        = "us-central1-a"

      google_compute_backend_bucket_name        = "image-backend-bucket-prod"
      google_compute_backend_bucket_description = "Contains beautiful images"
      google_compute_backend_bucket_cdn         = true
      google_storage_bucket_name                = "image-store-bucket-prod"
      google_storage_bucket_location            = "EU"

      network_name = "vpc-prod"
      routing_mode = "GLOBAL"
      subnets = [
        {
          subnet_name   = "mgmt-subnet-prod"
          subnet_ip     = "10.10.10.0/24"
          subnet_region = "us-central1"
          description   = "This subnet for bastion"
        },
        {
          subnet_name   = "app-subnet-prod"
          subnet_ip     = "10.10.20.0/24"
          subnet_region = "us-central1"
          description   = "This subnet has a description"
        }
      ]
      rules = [{
        name                    = "allow-ssh-ingress-prod"
        description             = null
        direction               = "INGRESS"
        priority                = null
        ranges                  = ["0.0.0.0/0"]
        source_tags             = null
        source_service_accounts = null
        target_tags             = ["allow-ssh-ingress-prod"]
        target_service_accounts = null
        allow = [{
          protocol = "tcp"
          ports    = ["22"]
        }]
        deny = []
        log_config = {
          metadata = "INCLUDE_ALL_METADATA"
        }
        },
        {
          name                    = "all-from-bastion-prod"
          description             = null
          direction               = "INGRESS"
          priority                = null
          ranges                  = ["10.10.10.0/24", "10.10.20.0/24"]
          source_tags             = null
          source_service_accounts = null
          target_tags             = null
          target_service_accounts = null
          allow = [{
            protocol = "tcp"
            ports    = []
          }]
          deny = []
          log_config = {
            metadata = "INCLUDE_ALL_METADATA"
          }
        },
        {
          name                    = "allow-https-ingress-prod"
          description             = null
          direction               = "INGRESS"
          priority                = null
          ranges                  = ["0.0.0.0/0"]
          source_tags             = null
          source_service_accounts = null
          target_tags             = ["allow-https-ingress-prod"]
          target_service_accounts = null
          allow = [{
            protocol = "tcp"
            ports    = ["443"]
          }]
          deny = []
          log_config = {
            metadata = "INCLUDE_ALL_METADATA"
          }
      }]
      compute_instance = {
        bastion-prod = {
          instance_name = "bastion-prod"
          network       = "vpc-prod"
          subnetwork    = "mgmt-subnet-prod"
          tags          = ["allow-ssh-ingress-prod"]
          template_file = "bastion.sh.tpl"
          domain_name   = "bastion-prod.com"

        }
        zammad-0-prod = {
          instance_name = "zammad-0-prod"
          network       = "vpc-prod"
          subnetwork    = "app-subnet-prod"
          tags          = ["allow-https-ingress-prod"]
          template_file = "app.sh.tpl"
          domain_name   = "zammad-0.com"

        }
        zammad-1-prod = {
          instance_name = "zammad-1-prod"
          network       = "vpc-prod"
          subnetwork    = "app-subnet-prod"
          tags          = ["allow-https-ingress-prod"]
          template_file = "app.sh.tpl"
          domain_name   = "zammad-1.com"

        }
      }

      tags = {
        Created_by  = "Terraform",
        Environment = "prod",
        Product     = "Zammad"
      }
    }
  }
}
