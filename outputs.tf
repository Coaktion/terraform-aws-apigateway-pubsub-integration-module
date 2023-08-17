output "api_integration" {
  description = "API Gateway integration"
  value = {
    rest_api_id = aws_api_gateway_rest_api.rest_api.id
    resource_id = aws_api_gateway_resource.resource.id
    http_method = aws_api_gateway_method.method.http_method
    integration = aws_api_gateway_integration.integration.id
  }
}

output "pubsub" {
  description = "PubSub module"
  value = module.pubsub
}
