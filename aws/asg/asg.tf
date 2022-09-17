resource "aws_autoscaling_group" "asg" {
  vpc_zone_identifier = var.subnet_ids
  desired_capacity    = var.desired_capacity
  max_size            = var.desired_capacity
  min_size            = var.desired_capacity

  launch_template {
    id      = aws_launch_template.ec2.id
    version = "$Latest"
  }
}
