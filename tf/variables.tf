variable "environment" {
  description = "The current environemnt"
  type = string
}

variable "region" {
  description = "The region to deploy AWS resources"
  type = string
  default = "us-east-1"
}