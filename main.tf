module "dev-infra" {
  source = "./infra-app"
  env = "dev"
  bucket_name = "infra-bucket-24april"
  instance_count = 1
  instance_type = "t2.micro"
  ec2_ami_id = "ami-0e35ddab05955cf57"
  hash_key = "StudentID"
}

 module "prd-infra" {
  source = "./infra-app"
  env = "prd"
  bucket_name = "infra-bucket-24april"
  instance_count = 2
  instance_type = "t2.micro"
  ec2_ami_id = "ami-0e35ddab05955cf57"
  hash_key = "StudentID"
}

module "stg-infra" {
  source = "./infra-app"
  env = "stg"
  bucket_name = "infra-bucket-24april"
  instance_count = 1
  instance_type = "t2.micro"
  ec2_ami_id = "ami-0e35ddab05955cf57"
  hash_key = "StudentID"
}