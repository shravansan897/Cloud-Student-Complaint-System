resource "aws_cloudwatch_log_group" "lambda_logs" {
  name              = "/aws/lambda/${aws_lambda_function.complaint_backend.function_name}"
  retention_in_days = 7

  tags = {
    Name      = "Student Complaint Lambda Logs"
    Project   = "Student Complaint Request Management System"
    ManagedBy = "Terraform"
  }
}