variable "aws_access_key" {
  description = "AWS access key"
  default     = "${AWS_ACCESS_KEY}"
}
variable "aws_secret_key" {
  description = "AWS secret key"
  default     = "${AWS_SECRET_KEY}"
}
variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-1"
}
variable "vpc_cidr" {
  description = "The VPC CIDR"
  default     = "10.0.0.0/16"
}
variable "publicsubnet01_cidr" {
  description = "The 1st public subnet CIDR"
  default     = "10.0.0.0/24"
}
variable "publicsubnet02_cidr" {
  description = "The 2nd public subnet CIDR"
  default     = "10.0.1.0/24"
}
variable "privatesubnet01_cidr" {
  description = "The 1st private subnet CIDR"
  default     = "10.0.2.0/24"
}
variable "privatesubnet02_cidr" {
  description = "The 2nd private subnet CIDR"
  default     = "10.0.3.0/24"
}
