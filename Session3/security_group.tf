connection {
		type        = "ssh"
		host        = self.public_ip
		user        = "ec2-user"
		private_key = file("~/.ssh/id_rsa")
		# Default timeout is 5 minutes
		timeout     = "4m"
	}

	provisioner "file" {
		content     = "Hello there"
		destination = "/home/ec2-user/devops.txt"
	}

  provisioner "file" {
		source      = "./instance-ip.txt"
		destination = "/home/ec2-user/instance-ip.txt"
	}

	provisioner "local-exec" {
		command = "echo ${self.public_ip} > instance-ip.txt"
	}

	 provisioner "remote-exec" {
	 	inline = [
	 		"touch /home/ec2-user/devops-remote-exec.txt",
       "sudo yum install httpd -y",
       "sudo systemctl enable httpd",
       "sudo systemctl start httpd"
	 	]
	 }

  provisioner "remote-exec" {
		inline = [
			 "sudo wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat/jenkins.repo",
             "sudo rpm --import https://pkg.jenkins.io/redhat/jenkins.io.key",
             "sudo yum upgrade",
             "sudo yum install jenkins java-1.8.0-openjdk-devel -y",
             "sudo systemctl daemon-reload",
             "sudo systemctl start jenkins",
             "sudo systemctl enable jenkins"
		]
	}
data "aws_vpc" "existing_vpc" {
  id = var.vpc_id
}

resource "aws_security_group" "sg_1" {
  name        = var.security_group_name
  description = var.security_group_description
  vpc_id      = data.aws_vpc.existing_vpc.id

  ingress {
    description = "ssh from internet"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "http from internet"
    from_port   = 8080
    to_port     = 8080
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "http from internet"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.prefix} allow_ssh_http"
  }
}
