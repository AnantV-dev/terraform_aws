variable "region" {
  description = "aws region"
  default     = "us-east-2"
}

variable "ami" {
  description = "This is the ami id for ec2 instance"
  default     = "ami-077e31c4939f6a2f3"
}

variable "instance_type" {
  description = "This is insyance type"
  default     = "t2.micro"
}

variable "key_name" {
  description = "This is the key used for ec2"
  default     = "ec2key"
}

variable "subnet_id" {
  description = "This is subnet"
  default     = "subnet-02454f81f45b16e54"
}

variable "sg_ids" {
  description = "These are the sceurity groups for ec2"
  type        = list(string)
  default     = ["sg-0cef13f6258380bd4"]
}

variable "ec2_name" {
  description = "This is the name for ec2"
  default     = ""
}
