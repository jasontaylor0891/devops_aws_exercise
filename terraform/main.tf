provider "aws" {
        #access_key = "${var.access_key}"
        #secret_key = "${var.secret_key}"
        #region = "${var.region}"
        access_key = var.access_key
        secret_key = var.secret_key
        region = var.region
}

# Creating IAM role so we can use aws cli to download the file to the EC2 instance.
resource "aws_iam_role" "s3_role" {
  name = "s3_role"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "ec2.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF

  tags = {
      tag-key = "tag-value"
  }
}

resource "aws_iam_instance_profile" "test_profile" {
  name = "test_profile"
  role = aws_iam_role.s3_role.name
}

resource "aws_iam_role_policy" "test_policy" {
  name = "test_policy"
  role = aws_iam_role.s3_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "s3:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}

# Create Security Group so we can ssh and copy from S3.
resource "aws_security_group" "ec2-sg" {
  name   = "ec2_sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }

}

# Create S3 bucket to upload file to.
resource "aws_s3_bucket" "b" {
  bucket = "devops-aws-bucket"
  acl    = "private"

  tags = {
    Name        = "devops-aws-bucket"
  }
}

# Upload file to bucket
resource "aws_s3_bucket_object" "object" {

  bucket = aws_s3_bucket.b.id
  key    = basename(var.uploadFile)
  acl    = "public-read"  # or can be "public-read"
  source = var.uploadFile
  
}

# Create EC2 instance and upload file via user data.
resource "aws_instance" "role-test" {
  ami = var.aws_ami
  instance_type = var.instance_size
  iam_instance_profile = aws_iam_instance_profile.test_profile.name
  key_name = "devops_aws_exercise_tf"
  vpc_security_group_ids = [aws_security_group.ec2-sg.id]
  user_data = file("upload_file.sh")
	tags = {
		Name = var.instance_name	
	}
}