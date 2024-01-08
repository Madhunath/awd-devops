resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = "t2.micro"

  subnet_id           = aws_subnet.my_subnet.id
  security_groups     = [aws_security_group.my_security_group.id]

  tags = {
    Name = "MyEC2Instance"
  }

   associate_public_ip_address = true

}
