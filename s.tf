terraform {
  backend "s3" {
    bucket = "andrii-sereda-project-kgb-terraform-state" // Bucket where to SAVE Terraform State
    key    = "dev/servers/terraform.tfstate"             // Object name in the bucket to SAVE Terraform State
    region = "us-east-1"                                 // Region where bycket created
  }
}
