data "aws_availability_zones" "mictlan-117" {}

data "aws_ami" "aml2023-latest" {
  most_recent = true
  owners = ["137112412989"] #Amazon owner ID

  filter {
    name = "name"
    values = ["al2023-ami-2023.3.20240219.0-kernel-6.1-x86_64"] #Image name
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"] # VirtualizationType
  }
  
}

# Create EC2 t2.micro instance with Amazon Linux 2023 AMI
resource "aws_instance" "mictlan-ec2-al2023" {
  ami           = data.aws_ami.aml2023-latest.id
  instance_type = "t2.micro"  
  availability_zone = data.aws_availability_zones.avilable.names[0]

  provisioner "local-exec" {
    command = "echo ${aws_instance.MyFirstInstnace.private_ip} >> mictlan_ec2_al2023_private_ips.txt"
  }


  tags = {
    Name = "mictlan-ec2-al2023"
  }
  
}

output "public_ip" {
  value = aws_instance.MyFirstInstnace.public_ip 
}