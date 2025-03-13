provider "aws" {
  region = "us-east-2"  # Change this to your preferred region
}

resource "aws_instance" "jenkins_server" {
  ami           = "ami-0cb91c7de36eed2cb" # Replace with the latest Ubuntu AMI
  instance_type = "t2.small"
  vpc_security_group_ids = ["sg-0c47d286a2a26f0ae"] # Replace it with the security group of 2048-Jenkins-Terraform-Automation
  key_name      = "2048"  # Replace with your Key-name
  tags = {
    Name = "Terraform-Jenkins-Server"
  }
}

output "instance_public_ip" {
  value = aws_instance.jenkins_server.public_ip
}
