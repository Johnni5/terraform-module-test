resource "aws_instance" "db_server" {
  instance_type = "t2.micro"
  ami = var.ec2_ami
  
  tags = {
    name = var.dbname
    location = "ger"
  }
}

data "aws_ami" "ec2_ami" {
  most_recent = true
  owners      = ["<YOUR_OWNER-ID>"] // start creating process of instance, copy ami-id, search under public-ami -> OWNER-ID

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

}

output "db_name" {
  value = aws_instance.db_server.id
}

output "db_priv_ip" {
  value = aws_instance.db_server.private_ip
}
