#Create N EC2 t2.micro instance with Amazon Linux 2023 AMI
resource "aws_instance" "web_instance" {
  count         = var.InstanceCount
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"

  tags = {
    Name = "web_instance-${count.index}"
  }

  security_groups = "${var.Security_Groups}"
  
}