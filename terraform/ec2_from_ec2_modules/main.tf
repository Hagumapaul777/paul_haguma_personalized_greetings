module "ec2_instance" {
  source        = "./../modules/ec2_personlized_greating/"   # Path to your module
  ami           = "ami-04a81a99f5ec58529"    # Replace with the correct AMI ID
  instance_type = "t2.micro"                  # EC2 instance type
  key_name      = "13th_july_2024_personalized_greetings"                # Replace with your SSH key name
  instance_name = "Assignment_machine2"
  region        = "us-east-1"                 # AWS region (optional)
}

output "instance_public_ip" {
  value = module.ec2_instance.instance_public_ip