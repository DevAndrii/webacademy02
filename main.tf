provider "aws" {}

#### export AWS_ACCESS_KEY_ID=QWEQWEQWEQWEQWEQEW
#### export AWS_SECRET_ACCESS_KEY=qweqweQWEQWE123123QWEQWEqweqwe
#### export AWS_DEFAULT_REGION=eu-central-1

resource "aws_instance" "my_server_web" {
  count = 2
  ami                    = "ami-03a71cec707bfc3d7"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]

  tags = {
    Name = "Server-Web"
  }
  depends_on = [aws_instance.my_server_db, aws_instance.my_server_app]
}
resource "aws_instance" "my_server_app" {
  ami                    = "ami-03a71cec707bfc3d7"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]

  tags = {
    Name = "Server-Application"
  }

  depends_on = [aws_instance.my_server_db]
}
resource "aws_instance" "my_server_db" {
  ami                    = "ami-03a71cec707bfc3d7"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_webserver.id]

  tags = {
    Name = "Server-Database"
  }
}

    lifecycle {
    create_before_destroy = true
    }
  }
