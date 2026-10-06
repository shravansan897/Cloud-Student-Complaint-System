resource "aws_cognito_user_pool" "students" {
  name = "student-complaint-users"

  username_attributes = ["email"]

  auto_verified_attributes = ["email"]

  tags = {
    Name      = "Student Complaint User Pool"
    Project   = "Student Complaint Request Management System"
    ManagedBy = "Terraform"
  }
}
resource "aws_cognito_user_group" "students" {
  name         = "Students"
  user_pool_id = aws_cognito_user_pool.students.id
  description  = "College students who can submit and track complaints"
  precedence   = 2
}
resource "aws_cognito_user_group" "admins" {
  name         = "Admins"
  user_pool_id = aws_cognito_user_pool.students.id
  description  = "College administrators who manage student complaints"
  precedence   = 1
}
resource "aws_cognito_user_pool_client" "frontend" {
  name         = "student-complaint-frontend"
  user_pool_id = aws_cognito_user_pool.students.id

  generate_secret = false

  explicit_auth_flows = [
    "ALLOW_USER_PASSWORD_AUTH",
    "ALLOW_REFRESH_TOKEN_AUTH"
  ]
}
