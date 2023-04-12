provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "wordpress-instance" {
  ami           = "ami-007855ac798b5175e"
  instance_type = "t2.micro"
  key_name      = "mykey"
  subnet_id     = "subnet-id"
  vpc_security_group_ids = [
    "sg-id",
  ]
  tags = {
      Name = "Wordpress-Server"
  }

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("mykey.pem")
    host        = self.public_ip
  }

  provisioner "remote-exec" {
    inline = [
      "mkdir /home/ubuntu/wordpress-app",
      
    ]
  }

  provisioner "file" {
    source = "docker.sh"
    destination = "/home/ubuntu/docker.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /home/ubuntu/docker.sh",
      "./docker.sh",
    ]
  }

# transfer files to newly created instance
  provisioner "file" {
    source = "docker-compose.yml"
    destination = "/home/ubuntu/wordpress-app/docker-compose.yml"
  }

  provisioner "file" {
    source = "nginx.conf"
    destination = "/home/ubuntu/wordpress-app/nginx.conf"
  }

  provisioner "file" {
    source = "nginx-logrotate.conf"
    destination = "/home/ubuntu/wordpress-app/nginx-logrotate.conf"
  }

  provisioner "file" {
    source = "analyze-logs.sh"
    destination = "/home/ubuntu/wordpress-app/analyze-logs.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "docker-compose -f wordpress-app/docker-compose.yml up -d",
    ]
  }
}
