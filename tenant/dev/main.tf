module "vpc" {
  source         = "../../modules/terraform-aws-vpc"
  name           = "my-vpc"                         
  cidr_block     = "10.0.0.0/16"                      
  public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  azs            = ["us-east-1a", "us-east-1b"]
  environment    = "dev"
}


module "ec2" {
  source        = "../../modules/terraform-aws-ec2"
  ami           = "ami-04b4f1a9cf54c11d0" # ubuntu ami 
  instance_type = "t2.micro"
  vpc_id        = module.vpc.vpc_id
  subnet_id     = element(module.vpc.public_subnet_ids, 0)
  key_name      = "devops-keypem-va"
  environment   = "dev"
  name          = "terraform-ec2-instance"
  user_data     = file("${path.module}/userdata.sh")
}
