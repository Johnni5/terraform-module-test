resource "aws_instance" "web_server" {
  instance_type = "t2.micro"
  ami = var.ec2_ami
  associate_public_ip_address = true

  user_data = "${file("server-script.sh")}"

  tags = {
    name = var.webname
    location = "ger"
  }
}

data "aws_ami" "ec2_ami" {
  most_recent = true
  owners      = ["099720109477"]

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

}


output "web_srv_name" {
  value = aws_instance.web_server.id
}

output "web_srv_priv_ip" {
  value = aws_instance.web_server.private_ip
}
