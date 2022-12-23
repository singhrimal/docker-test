data "aws_ami" "amazon_linux_2" {
  most_recent = true
  owners      = ["amazon"]

  filter {
    name   = "owner-alias"
    values = ["amazon"]
  }

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*"]
  }
}

# My EC2 instance
resource "aws_instance" "DockerInstance" {
  ami                         = data.aws_ami.amazon_linux_2.id
  instance_type               = "t2.micro"
  subnet_id                   =  aws_subnet.publicSubnet.id
  vpc_security_group_ids      = [aws_security_group.InstanceSG.id]
  key_name                    = "keyname.pem"
  associate_public_ip_address = "true"

  tags = {
    "Name" = "dockerInstance"
  }
}