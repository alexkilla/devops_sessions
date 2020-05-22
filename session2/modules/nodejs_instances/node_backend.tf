#input variables
resource "aws_autoscaling_group" "frontend" {
  name_prefix          = "terraform-infrastructure-example"
  max_size             = 1
  min_size             = 1
  desired_capacity     = 1
  launch_configuration = aws_launch_configuration.as_conf.id
  vpc_zone_identifier  = var.public_subnets

  health_check_grace_period = 100
  # This is not in the official
  # wait_for_capacity_timeout = "5m"

  tag {
    key                 = "Name"
    value               = "${var.environment}-nodejs-instance"
    propagate_at_launch = true
  }
}

resource "aws_security_group" "sg_node_instance" {
  name        = "${var.environment}-allow-internet-access-ssh"
  description = "Allow connection from ssh"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["187.189.149.25/32"]
  }

  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name        = "${var.environment}-allow-elb-sg"
    Environment = "${var.environment}"
  }
}

resource "aws_launch_configuration" "as_conf" {
  name_prefix                 = "ubuntu"
  image_id                    = var.ami
  instance_type               = "t2.micro"
  user_data                   = file("${path.module}/files/script.sh")
  associate_public_ip_address = true
  key_name                    = var.key_name
  security_groups             = [aws_security_group.sg_node_instance.id]

  lifecycle {
    create_before_destroy = true
  }
}

