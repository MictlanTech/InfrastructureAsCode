#Create N EC2 t2.micro instance with Amazon Linux 2023 AMI
resource "aws_instance" "web_instance" {
  count         = 3
  ami           = "ami-0e731c8a588258d0d"
  instance_type = "t2.micro"

  tags = {
    Name = "web_instance-${count.index}"
  }
}