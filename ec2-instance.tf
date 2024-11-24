resource "aws_instance" "publicinstance" {
  ami           = data.aws_ami.amlin.id
  instance_type = var.instance_type
  key_name = "terraform-key"
  user_data = file("apache-install.sh")
   vpc_security_group_ids = [aws_security_group.publicsg.id]
   
   tags = {
    Name = "publicinstance"
  }

provisioner "file" {
      source = "apps/file-copy.html"
        destination = "/tmp/file-copy.html"
}

  provisioner "file" {
    content     = "ami used: ${self.ami}"
    destination = "/tmp/file.log"
  }

    provisioner "file" {
    source      = "apps/app1"
    destination = "/tmp"
  }

connection {
            type = "ssh"
            host = self.public_ip
            user = "ec2-user"
            private_key = file("private-key/terraform-key.pem")
        }
}

