resource "aws_api_gateway_deployment" "deployment" {
  depends_on = [
    aws_api_gateway_integration.integration,
    aws_api_gateway_method_response.method_response,
    aws_api_gateway_integration_response.name
  ]

  rest_api_id = aws_api_gateway_rest_api.rest_api.id
  stage_name  = var.stage_name
}
