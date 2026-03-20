resource "aws_instance" "ec2_nginx" {
  ami                         = "ami-0ec10929233384c7f"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.key.key_name
  subnet_id                   = aws_subnet.my_subnet.id
  associate_public_ip_address = true
  tags                        = local.common_tags

  vpc_security_group_ids = [aws_security_group.sg.id]

  user_data = <<EOF
#!/bin/bash
sleep 30
apt update -y
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx
echo "<h1>DevOps Lab - Gustavo Alves</h1>" > /var/www/html/index.html
echo "<h1>DevOps Lab - Gustavo Alves</h1>" > /var/www/html/index.nginx-debian.html
EOF

}

resource "aws_key_pair" "key" {
  key_name   = "my-key"
  public_key = file("./aws-key.pub")

}