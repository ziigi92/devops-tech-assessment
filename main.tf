provider "aws" {
  region = var.region
}

resource "aws_secretsmanager_secret" "interview_secret" {
  name = var.secret_name
}

resource "aws_secretsmanager_secret_version" "example" {
  secret_id     = aws_secretsmanager_secret.interview_secret.id
  secret_string = jsonencode({"date" = var.secret_date})
}

resource "aws_iam_role" "interview_bot" {
  name = var.iam_role_names["bot"]

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
  name = var.iam_role_names["developer"]

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
