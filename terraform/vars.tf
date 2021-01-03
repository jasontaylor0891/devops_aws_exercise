variable "access_key" {
description = "AWS Access key"
}

variable "secret_key" {
description = "AWS Secret Key"
}

variable "uploadFile" {
description = "File to upload to S3"
}

variable "instance_size" {
description = "The size if the EC2 instance we are creating"
}

variable "instance_name" {
description = "The name of the instance we are creating"
}


variable "region" {
description = "AWS region for hosting our EC2 instance"
default = "us-east-2"
}

variable "aws_ami" {
description = "AWS AMI we are using to create the EC2 instance."
default = "ami-0a0ad6b70e61be944"
}
