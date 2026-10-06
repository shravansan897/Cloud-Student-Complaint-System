resource "aws_apigatewayv2_api" "complaint_api" {
  name          = "student-complaint-api"
  protocol_type = "HTTP"

    cors_configuration {
    allow_origins = ["*"]

    allow_methods = [
      "GET",
      "POST",
      "PUT",
      "DELETE",
      "OPTIONS"
    ]

    allow_headers = [
      "Authorization",
      "Content-Type"
    ]
  }

  tags = {
    Name      = "Student Complaint API"
    Project   = "Student Complaint Request Management System"
    ManagedBy = "Terraform"
  }
}

resource "aws_apigatewayv2_integration" "lambda_integration" {
  api_id                 = aws_apigatewayv2_api.complaint_api.id
  integration_type       = "AWS_PROXY"
  integration_uri        = aws_lambda_function.complaint_backend.invoke_arn
  payload_format_version = "2.0"
}

resource "aws_apigatewayv2_route" "default" {
  api_id    = aws_apigatewayv2_api.complaint_api.id
  route_key = "ANY /complaints"
  target    = "integrations/${aws_apigatewayv2_integration.lambda_integration.id}"
    
  authorization_type = "JWT"
  authorizer_id      = aws_apigatewayv2_authorizer.cognito.id
}

resource "aws_apigatewayv2_stage" "default" {
  api_id      = aws_apigatewayv2_api.complaint_api.id
  name        = "$default"
  auto_deploy = true
}

resource "aws_lambda_permission" "api_gateway" {
  statement_id  = "AllowAPIGatewayInvoke"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.complaint_backend.function_name
  principal     = "apigateway.amazonaws.com"

  source_arn = "${aws_apigatewayv2_api.complaint_api.execution_arn}/*/*"
}
resource "aws_apigatewayv2_authorizer" "cognito" {
  api_id           = aws_apigatewayv2_api.complaint_api.id
  authorizer_type  = "JWT"
  authorizer_uri   = null
  identity_sources = ["$request.header.Authorization"]
  name             = "student-complaint-cognito-authorizer"

  jwt_configuration {
    audience = [aws_cognito_user_pool_client.frontend.id]
    issuer   = "https://cognito-idp.ap-south-1.amazonaws.com/${aws_cognito_user_pool.students.id}"
  }
}