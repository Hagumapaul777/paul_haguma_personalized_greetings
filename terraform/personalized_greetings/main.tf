terraform {
 backend "s3"{
    region = "eu-west-1"
    key = "my-test-ec2"
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
    Environment = "Dev"
    Project     = "Personalized-Greetings"
  }
}



module "ec2" {
  source        = "./../modules/ec2/"   # Path to your module
  ami           = "ami-0e9085e60087ce171"    # Replace with the correct AMI ID
  instance_type = "t2.micro"                  # EC2 instance type
  key_name      = "13th_july_2024_personalized_greetings"                # Replace with your SSH key name
  instance_name = "Assignment_machine2"
                # AWS region (optional)
  subnet_id = element(module.vpc.public_subnet_ids, 0)
}