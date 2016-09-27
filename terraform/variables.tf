variable "aws_access_key" {
  description = "AWS access key"
  default     = "xxxx"
}
variable "aws_secret_key" {
  description = "AWS secret key"
  default     = "xxxx"
}
variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-west-1"
}
#variable aws_azs {
#  default = { 
#    eu-west-1 = ["eu-west-1a", "eu-west-1b", "eu-west-1c"]
#    eu-central-1 = ["eu-central-1a", "eu-central-1b"]
#  }
#}
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
variable "default_ami" {
  description = "The default AMI"
  default     = "ami-d41d58a7"
}
variable "key_name" {
  description = "The default AMI"
  default     = "foudil_key"
}
