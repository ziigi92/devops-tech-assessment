provider "aws" {
  region = "us-east-1"
}
resource "aws_secretsmanager_secret" "interview_secret" {
  name = "extend-interview/francis"
}

resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = aws_secretsmanager_secret.interview_secret.id
  secret_string = "{\"date\":\"03/25/2024\"}"
}
resource "aws_iam_role" "interview_bot" {
  name = "interview-bot"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role" "interview_developer" {
  name = "interview-developer"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}