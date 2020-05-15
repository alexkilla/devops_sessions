
resource "aws_autoscaling_group" "bar" {
  name                 = "foobar3-terraform-test"
  max_size             = 1
  min_size             = 1
  desired_capacity     = 1
  launch_configuration = aws_launch_configuration.as_conf
  vpc_zone_identifier  = ["subnet-REMPLAZA", "subnet-REMPLAZA"]

  health_check_grace_period = 25
  wait_for_capacity_timeout = "30s"

  tag {
      key = "Name"
      value = "${var.environment}-nodejs-instance"
      propagate_at_launch = true
  }
}


resource "aws_launch_configuration" "as_conf" {
  name_prefix = "ubuntu"
  image_id      = "${var.ami}"
  instance_type = "t2.micro"

  user_data = file("${path.module}/files/script.sh")

  key_name = var.key_name

  lifecycle {
    create_before_destroy = true
  }
}