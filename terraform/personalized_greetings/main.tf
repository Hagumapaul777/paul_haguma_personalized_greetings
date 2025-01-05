terraform {
  backend "s3"{
    region = "eu-west-1"
    key = "my-test-ec2"
    bucket = "paul-tfstate-file"
  }
    
}
provider "aws" {
  region        = "us-east-1"
}
module "vpc" {
  source               = "../modules/vpc"
  cidr_block           = "10.0.0.0/16"
  vpc_name             = lookup({dev = "Dev_Personalized-Greetings-VPC", prod = "prod_Personalized-Greetings-VPC", staging = "staging_Personalized-Greetings-VPC"}, terraform.workspace, "test_Personalized-Greetings-VPC")
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnet_cidrs = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]
  default_tags = {
    Environment = lookup({dev = "Dev", prod = "prod", staging = "staging"}, terraform.workspace, "test")
    Project     = "Personalized-Greetings"
  }
}

module "ec2" {
  source        = "./../modules/ec2/"   # Path to your module
  ami           = "ami-0e2c8caa4b6378d8c"    # Replace with the correct AMI ID
  instance_type = "t2.micro"                  # EC2 instance type
  key_name      = "13th_july_2024_personalized_greetings"                # Replace with your SSH key name
  instance_name = lookup({dev = "dev_terraform_ec2", prod = "prod_terraform_ec2", staging = "staging_terraform_ec2"}, terraform.workspace, "test_terraform_ec2")
  subnet_id = element(module.vpc.public_subnet_ids, 0)
}