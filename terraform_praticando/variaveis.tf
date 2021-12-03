
variable "ambiente" {
  type        = string
}

variable "bucket_stage" {
  type        = string
}

variable "fefe_instance_name" {
  description = "Value of the Name tag for the EC2 instance"
  type        = string
  default     = "ExampleAppServerInstance"
}

variable "ami" {
  description = ""
  type        = string
  default     = "ami-830c94e3"
}

variable "ec2_type" {
  description = ""
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = ""
  type        = string
  default     = "us-east-1"
}