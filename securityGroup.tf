resource "aws_security_group" "InstanceSG" {
  vpc_id      = aws_vpc.myvpc.id
  name        = "Allow_tls"
  description = "Allow tls traffic"

  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "enabling SSH access for ec2 instance"
    from_port   = 22
    protocol    = "tcp"
    to_port     = 22
  }
  ingress {
    cidr_blocks = ["0.0.0.0/0"]
    description = "TLS from vpc"
    from_port   = 443
    protocol    = "tcp"
    to_port     = 443
  }
}