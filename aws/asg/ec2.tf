resource "aws_launch_template" "ec2" {
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name

  iam_instance_profile {
    arn = var.instance_profile_arn
  }

  network_interfaces {
    associate_public_ip_address = var.associate_public_ip
    security_groups             = var.security_groups
  }

  tag_specifications {
    resource_type = "instance"

    tags = {
      Name = "${var.prefix}-ec2"
    }
  }
}
