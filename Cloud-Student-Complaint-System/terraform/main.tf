resource "aws_s3_bucket" "frontend" {
  bucket = "cloud-student-complaint-system-frontend"

  tags = {
    Name        = "Student Complaint System Frontend"
    Project     = "Student Complaint Request Management System"
    Environment = "Development"
    ManagedBy   = "Terraform"
  }
}