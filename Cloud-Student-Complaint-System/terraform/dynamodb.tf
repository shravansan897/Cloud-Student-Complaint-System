resource "aws_dynamodb_table" "complaints" {
  name         = "student-complaints"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "complaint_id"

  attribute {
    name = "complaint_id"
    type = "S"
  }

  tags = {
    Name        = "Student Complaints Database"
    Project     = "Student Complaint Request Management System"
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}