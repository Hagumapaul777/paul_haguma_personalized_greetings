# modules/ec2-instance/provider.tf
provider "aws" {
  region = var.region
}