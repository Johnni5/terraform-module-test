resource "aws_vpc" "test_vpc" {
  cidr_block = "192.168.0.0/24"
  
  tags = {
    name = "test kurs vpc"
    location = "ger"
  }
}