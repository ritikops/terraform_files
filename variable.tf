variable "ec2_instance_type" {
	description = "ec2 instance type"
	default     = "t2.micro"
	type	    = string

}

variable "ec2_image_id" {
	description = "ec2 image id"
	default 	= "ami-0e35ddab05955cf57"
	type	    = string


}


variable "ec2_root_storage" {
	description = "ec2 root storage"
	default     = 15
	type	    = number
	
}

variable "ec2_root_storage_type" {
	description = "ec2 root storage type"
	default	    = "gp3"
	type	    = string
	}