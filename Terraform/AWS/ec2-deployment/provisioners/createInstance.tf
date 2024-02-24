resource "aws_key_pair" "terra_admin_key" {
  key_name = "terra_admin_key"
  public_key = file(var.PATH_TO_PUBLIC_KEY)
}

#Create N EC2 t2.micro instance with Amazon Linux 2023 AMI
resource "aws_instance" "web_instance" {
  ami           = lookup(var.AMIS, var.AWS_REGION)
  instance_type = "t2.micro"
  key_name = "terra_admin_key" # aws_key_pair.terra_admin_key.key_name

  depends_on = [ aws_key_pair.terra_admin_key ]

  tags = {
    Name = "web_instance"
  }

  provisioner "file" {
    source = "installNginx.sh"
    destination = "/tmp/installNginx.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/installNginx.sh",
      "sudo sed -i -e 's/\r$//' /tmp/installNginx.sh", # Remove Carriage Return Characters 
      "sudo /tmp/installNginx.sh",
    ]  
  }

  connection {
    host        = coalesce(self.public_ip, self.private_ip)
    type        = "ssh"
    user        = var.INSTANCE_USERNAME
    private_key = file(var.PATH_TO_PRIVATE_KEY)
  }
}