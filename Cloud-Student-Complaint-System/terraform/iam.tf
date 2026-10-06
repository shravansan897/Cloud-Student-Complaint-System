resource "aws_iam_role_policy" "lambda_dynamodb_policy" {
  name = "student-complaint-dynamodb-policy"
  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17"

    Statement = [
      {
        Effect = "Allow"

        Action = [
          "dynamodb:PutItem",
          "dynamodb:GetItem",
          "dynamodb:UpdateItem",
          "dynamodb:Query",
          "dynamodb:Scan"
        ]

        Resource = aws_dynamodb_table.complaints.arn
      }
    ]
  })
}