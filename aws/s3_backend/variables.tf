variable "bucket" {
  type = string
}

variable "table" {
  type = string
}

variable "region" {
  type        = string
  description = "The AWS region to deploy into."
}
