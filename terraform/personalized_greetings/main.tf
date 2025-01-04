terraform {
 backend "s3"{
    region = "eu-west-1"
    key = "my-test-vpc"
    bucket = "paul-tfstate-file"
    }
    
}
module "vpc" {
  source               = "../modules/vpc"
  cidr_block           = "10.0.0.0/16"
  vpc_name             = "Personalized-Greetings-VPC"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  default_tags = {
    Environment = ""
    Project     = "Personalized-Greetings"
  }
}