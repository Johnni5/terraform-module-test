resource "aws_security_group" "secgroup" {
   name        = "dev-sg"
  description = "dev sec group"
  vpc_id      = module.aws_vpc.test_vpc.id

  ingress {
    from_port   = ["${var.sec_port_range}"]
    to_port     = ["${var.sec_port_range}"]
    protocol    = "-1"
    cidr_blocks = ["<YOUR_IP_OR_ELSE>"] //your ip only, or free-for-all ;)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
}
