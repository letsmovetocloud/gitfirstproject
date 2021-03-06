# Terraform Configure setting block
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      
    }
  }
}

# Provider Block -line
provider "aws" {
  profile = "default" 
  region  = "us-east-1"
}

#Resource Block-developed by second develeoper 
resource "aws_instance" "ec2testserver" {
  ami           = "ami-041db4a969fe3eb68" 
  instance_type = "t2.medium"

}


# Create VPC Terraform Module
module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  

  # VPC Basic Details
  name = "vpc-dev"

  cidr = "192.168.0.0.16"   
  azs                 = ["ap-south-1a"]
  private_subnets     = ["192.168.2.0/24"]
  public_subnets      = ["192.168.1.0/24"]



#new comment added 
