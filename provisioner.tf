resource "null_resource" "key" {
  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/Downloads/keyname.pem")
    host        = aws_instance.DockerInstance.public_ip
  }
  provisioner "file" {
    source      = "./shell/build.sh"
    destination = "/home/ec2-user/build.sh"

  }

  provisioner "remote-exec" {
    inline = [
      "sudo chmod +x /home/ec2-user/build.sh",
      "bash /home/ec2-user/build.sh"
    ]
  }
  depends_on = [aws_instance.DockerInstance]
}

