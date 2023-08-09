data "aws_caller_identity" "current" {}

resource "aws_api_gateway_rest_api" "rest_api" {
  name        = var.resource_prefix != "" ? "${var.resource_prefix}-${var.api_name}" : var.api_name
  description = var.api_description
  depends_on = [ module.pubsub ]
}
