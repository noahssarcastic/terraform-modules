variable "associate_public_ip" {
  type        = bool
  description = "Whether to assign a public IP to the instances."
  default     = false
}

variable "desired_capacity" {
  type        = number
  description = "How many instances shall be active at any time."
}

variable "image_id" {
  type        = string
  description = "Which AMI the instances will use."
}

variable "instance_profile_arn" {
  type        = string
  description = "Which IAM instance profile the instances will use."
  default     = ""
}

variable "instance_type" {
  type        = string
  description = "Which instance type the instances will use."
}

variable "key_name" {
  type        = string
  description = "Which SSH key the instances will accept connections from."
  default     = ""
}

variable "prefix" {
  type        = string
  description = "value"
}

variable "security_groups" {
  type        = [string]
  description = "The list of security group ids the instances will use."
  default     = []
}

variable "subnet_ids" {
  type        = [string]
  description = "The list of subnets the ASG will provision instances into."
}
