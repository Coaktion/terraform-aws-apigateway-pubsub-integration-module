## Terraform API Gateway Integration pubsub module

Terraform module which creates API Gateway Integration resources on AWS.

## Usage

```hcl
provider "aws" {
  region = "us-east-1"
}

module "aws_api_gateway_integration" {
  source     = "github.com/Coaktion/terraform-aws-apigateway-pubsub-integration-module"
  topic      = "validation_topic"
  queue      = "validation_queue"
  account_id = "000000000000"
  fifo       = true
  api_name   = "teste_tinoco_sns"
  resource_prefix = "app_tinoco"
}
```
