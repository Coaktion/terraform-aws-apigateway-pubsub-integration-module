resource "aws_iam_role" "sns_integration_role" {
  name = "${var.resource_prefix}__sns_integration_role"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "apigateway.amazonaws.com"
        },
        "Action" : "sts:AssumeRole"
      }
    ]
  })

  tags = var.default_tags

  depends_on = [module.pubsub]

  lifecycle {
    ignore_changes = [tags]
  }
}

resource "aws_iam_policy" "sns_publish_policy" {
  name = "${var.resource_prefix}__sns_publish_policy"
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "sns:Publish"
        ]
        Resource = [
          local.topic_arn
        ]
      }
    ]
  })

  depends_on = [module.pubsub]
}

resource "aws_iam_role_policy_attachment" "sns_integration_policy" {
  policy_arn = aws_iam_policy.sns_publish_policy.arn
  role       = aws_iam_role.sns_integration_role.name
}
