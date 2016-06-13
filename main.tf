#
# DO NOT DELETE THESE LINES!
#
# Your subnet ID is:
#
#     subnet-99a58be2
#
# Your security group ID is:
#
#     sg-8e08dfe6
#
# Your AMI ID is:
#
#     ami-74ee001b
#
# Your Identity is:
#
#     hashiconf-d67d8ab4f4c10bf22aa353e27879133c
#
# Your AccessKeyID and SecretAccessKey are:
#
#     AKIAIKPA7OTEI5ZT54PA
#     ymKJwim5Ne4nKSGWIhoX/e+ZL5V/V23X/tFKjUpM
#

variable "aws_access_key" {}
variable "aws_secret_key" {}
variable "aws_region" {
  default = "eu-central-1"
}

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "ymKJwim5Ne4nKSGWIhoX/e+ZL5V/V23X/tFKjUpM"
  region     = "eu-central-1"
}

resource "aws_instance" "web" {
  count = "2"
  ami = "ami-74ee001b"
  instance_type = "t2.micro"
  subnet_id = "subnet-99a58be2"
  vpc_security_group_ids = ["sg-8e08dfe6"]
  tags {
    Identity = "hashiconf-d67d8ab4f4c10bf22aa353e27879133c"
    tag1 = "gareth"
    tag2 = "morris"
    }
}

output "public_ip" {
  value = "${join(", ", aws_instance.web.*.public_ip)}"
}

output "public_dns" {
  value = "${join(", ", aws_instance.web.*.public_dns)}"
}
