data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "aws_instance" "web" {
    #count = var.counter  
    #count = 2
  ami           = data.aws_ami.ubuntu.id
  
  instance_type = "t3.micro"

  tags = {
    #Name = "Helloworld-${count.index + 1}"
    Name = "HelloWorld"
    Project = "CLOD1003"
    Owner = "SAI"
  }
}

resource "aws_instance" "web1" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = "t3.micro"

  tags = {
    Name = "helloworld123"
    Project = "CLOUD1003"
    Owner = "Sai"
  }
}