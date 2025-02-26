provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "todo_server" {
  ami           = "ami-0abcdef1234567890"
  instance_type = "t2.micro"
  key_name      = "my-key-pair"

  security_groups = [aws_security_group.todo_sg.name]

  provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y docker.io",
      "sudo apt install -y docker-compose"
    ]
  }
}
