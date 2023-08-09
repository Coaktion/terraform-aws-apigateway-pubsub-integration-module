locals {
  topics = [
    {
      name                        = var.topic
      content_based_deduplication = var.fifo ? true : false
    }
  ]

  queues = [
    {
      name = var.queue
      topics_to_subscribe = [
        {
          name = var.topic
        }
      ]
    }
  ]

  topic_name_partial = var.resource_prefix != "" ? "${var.resource_prefix}__${var.topic}" : var.topic
  topic_name         = var.fifo ? "${local.topic_name_partial}.fifo" : local.topic_name_partial
  topic_arn          = "arn:aws:sns:${var.region}:${var.account_id}:${local.topic_name}"
}
