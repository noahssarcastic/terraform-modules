variable "prefix" {
  type        = string
  description = "Each resource in this deployment will be given a name starting with this prefix."
}

variable "region" {
  type        = string
  description = "The AWS region to deploy into."
}
