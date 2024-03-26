variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "secret_name" {
  description = "The name of the secrets manager secret"
  type        = string
  default     = "extend-interview/francis"
}

variable "secret_date" {
  description = "The date to be stored in the secret"
  type        = string
  default     = "03/25/2024"
}

variable "iam_role_names" {
  description = "Names for the IAM roles"
  type        = map(string)
  default = {
    bot        = "interview-bot"
    developer  = "interview-developer"
  }
}
