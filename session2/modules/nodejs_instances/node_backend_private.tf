#input variables
resource "aws_autoscaling_group" "backend" {
  name_prefix          = "terraform-infrastructure-example"
  max_size             = 1
  min_size             = 1
  desired_capacity     = 1
  launch_configuration = aws_launch_configuration.as_conf_private.id
  vpc_zone_identifier  = var.private_subnets

  health_check_grace_period = 100
  # This is not in the official
  # wait_for_capacity_timeout = "5m"

  tag {
    key                 = "Name"
    value               = "${var.environment}-nodejs-instance"
    propagate_at_launch = true
  }
}

resource "aws_security_group" "sg_node_private_instance" {
  name        = "${var.environment}-allow-private"
  description = "Allow connections from public subnet"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = var.public_cidrs
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.public_cidrs
  }

  #ping
  ingress {
    from_port   = -1
    to_port     = -1
    protocol    = "icmp"
    cidr_blocks = var.public_cidrs
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

resource "aws_launch_configuration" "as_conf_private" {
  name_prefix     = "ubuntu"
  image_id        = var.ami
  instance_type   = "t2.micro"
  user_data       = file("${path.module}/files/script.sh")
  key_name        = var.key_name
  security_groups = [aws_security_group.sg_node_private_instance.id]

  lifecycle {
    create_before_destroy = true
  }
}

