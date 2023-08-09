locals {
  request_parse   = "Action=Publish&TopicArn=$util.urlEncode('${local.topic_arn}')&Message=$util.urlEncode($input.body)"
  request_mapping = var.fifo ? "${local.request_parse}&MessageGroupId=$context.requestId" : local.request_parse
}

resource "aws_api_gateway_integration" "integration" {
  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  resource_id = aws_api_gateway_resource.resource.id
  http_method = aws_api_gateway_method.method.http_method

  integration_http_method = "POST"

  type        = "AWS"
  uri         = "arn:aws:apigateway:us-east-1:sns:action/Publish"
  credentials = aws_iam_role.sns_integration_role.arn

  passthrough_behavior = "WHEN_NO_TEMPLATES"

  request_parameters = {
    "integration.request.header.Content-Type" = "'application/x-www-form-urlencoded'"
  }

  request_templates = {
    "application/json" = local.request_mapping
  }
}
