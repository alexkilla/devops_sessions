#input variables
resource "aws_autoscaling_group" "bar" {
  name                 = "terraform-infrastructure-example"
  max_size             = 1
  min_size             = 1
  desired_capacity     = 1
  launch_configuration = aws_launch_configuration.as_conf.id
  vpc_zone_identifier  = var.public_subnets

  health_check_grace_period = 100
  # This is not in the official
  # wait_for_capacity_timeout = "5m"

  tag {
      key = "Name"
      value = "${var.environment}-nodejs-instance"
      propagate_at_launch = true
  }
}

resource "aws_launch_configuration" "as_conf" {
  name_prefix = "ubuntu"
  image_id      = var.ami
  instance_type = "t2.micro"

  user_data = file("${path.module}/files/script.sh")

  lifecycle {
    create_before_destroy = true
  }
}

