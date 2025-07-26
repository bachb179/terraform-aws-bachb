resource "aws_instance" "ubuntu" {
  ami           = "ami-02c7683e4ca3ebf58"
  instance_type = "t3a.small"

  tags = {
    Name = "ubuntuserver"
  }
}