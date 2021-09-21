provider "aws" {}
  region = var.region
#### export AWS_ACCESS_KEY_ID=QWEQWEQWEQWEQWEQEW
#### export AWS_SECRET_ACCESS_KEY=qweqweQWEQWE123123QWEQWEqweqwe
#### export AWS_DEFAULT_REGION=eu-central-1



resource "aws_instance" "my_server_web" {
  count = 2
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_webserver.id]

  tags = merge(var.common_tags, { Name = "Server IP" })

  depends_on = [aws_instance.my_server_db, aws_instance.my_server_app]
}



resource "aws_instance" "my_server_app" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_webserver.id]
  monitoring             = var.enable_monitoring

  tags = var.common_tags

  depends_on = [aws_instance.my_server_db]
}

resource "aws_instance" "my_server_db" {
  ami                    = var.ami
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_webserver.id]

  tags = var.common_tags
}

    lifecycle {
    create_before_destroy = true
    }
  }
