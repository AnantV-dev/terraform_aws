module "ec2" {
  source = "./modules/ec2"
  #ec2_ami = ""
  #ec2_instance_type = ""
  #ec2_key_name = ""
  #ec2_subnet_id = ""
  #ec2_sg_ids = [""]
  ec2_name = "Terraform-EC2"
}
