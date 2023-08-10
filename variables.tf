variable "account_id" {
  description = "AWS Account ID"
  type        = string
}

variable "region" {
  description = "AWS Region"
  type        = string
  default     = "us-east-1"
}

variable "default_tags" {
  description = "A map of tags to assign to all resources."
  type        = map(string)
  default     = {}
}

variable "resource_prefix" {
  description = "A prefix to add to all resource names."
  type        = string
  default     = ""
}

variable "fifo" {
  description = "Boolean designating a FIFO topic and queue. If not set, it defaults to false making it standard."
  type        = bool
  default     = false
}


variable "authorization" {
  description = "Authorization type for API Gateway method"
  type        = string
  default     = "NONE"
}

variable "path_integration" {
  description = "Path for API Gateway integration"
  type        = string
  default     = "sns"
}

variable "path_method" {
  description = "Path for API Gateway method"
  type        = string
  default     = "POST"
}

variable "stage_name" {
  description = "Stage name for API Gateway deployment"
  type        = string
  default     = "prod"
}

variable "topic" {
  description = "Topic name for API Gateway integration"
  type        = string
}

variable "queue" {
  description = "Queue name for API Gateway integration"
  type        = string
}

variable "api_name" {
  description = "API name for API Gateway integration"
  type        = string
}

variable "api_description" {
  description = "API description for API Gateway integration"
  type        = string
  default     = "API Gateway integration for SNS"
}

variable "filter_policy" {
  description = "Filter Policy"
  type        = map(string)
  default     = {}
}
