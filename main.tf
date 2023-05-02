provider "aws" {
        region = "ap-south-1"
        access_key = var.ac_key
        secret_key = var.sec_key
      
    }


resource "aws_s3_bucket" "etp-epam" {
    bucket = "etp-epam"
  versioning {
    enabled = true
  }

}

resource "aws_iam_role" "s3_role" {
    name = "s3_role"
    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
        {
            Effect = "Allow"
            Principal = {
            Service = "ec2.amazonaws.com"
            }
            Action = "sts:AssumeRole"
        }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "s3full_access" {
  policy_arn = "arn:aws:iam::aws:policy/AmazonS3FullAccess"
  role       = aws_iam_role.s3_role.id
}

resource "aws_instance" "project_ec2" {
  ami           = "ami-02eb7a4783e7e9317"
  instance_type = "t2.micro"

  iam_instance_profile = aws_iam_instance_profile.s3-profile.name

  

  tags = {
    Name = "project_ec2"
  }
}

resource "aws_iam_instance_profile" "s3-profile" {
  name = "s3-role"
  role = aws_iam_role.s3_role.name
}

