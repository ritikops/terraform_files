variable "env" {
    description = "Environment "
    type        = string
}
variable "bucket_name" {
    description = "Bucket name"
    type        = string
  
}

variable "instance_count" {
    description = "Number of instances"
    type        = number
    # default     = 1
}

variable "instance_type" {
    description = "Instance type"
    type        = string
    # default     = "t2.micro"
}

variable "ec2_ami_id" {
    description = "AMI ID"
    type        = string
    #  default     = "ami-0c55b159cbfafe1f0"
}

variable "hash_key" {
    description = "Hash key for DynamoDB"
    type        = string
}