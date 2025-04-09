provider "aws" {
  region = "sa-east-1"
  access_key = "access_key"
  secret_key = "secret_key"

  s3_use_path_style = true
  skip_credentials_validation = true
  skip_metadata_api_check = true
  skip_requesting_account_id = true

  endpoints {
    apigateway = "http://192.168.1.100:4566"
    apigatewayv2 = "http://192.168.1.100:4566"
    cloudformation = "http://192.168.1.100:4566"
    cloudwatch = "http://192.168.1.100:4566"
    cloudwatchlogs = "http://192.168.1.100:4566"
    dynamodb = "http://192.168.1.100:4566"
    ec2 = "http://192.168.1.100:4566"
    es = "http://192.168.1.100:4566"
    elasticache = "http://192.168.1.100:4566"
    elasticloadbalancing = "http://192.168.1.100:4566"
    elasticloadbalancingv2 = "http://192.168.1.100:4566"
    elastictranscoder = "http://192.168.1.100:4566"
    events = "http://192.168.1.100:4566"
    firehose = "http://192.168.1.100:4566"
    iam = "http://192.168.1.100:4566"
    kinesis = "http://192.168.1.100:4566"
    kinesisanalytics = "http://192.168.1.100:4566"
    kinesisanalyticsv2 = "http://192.168.1.100:4566"
    kinesisvideo = "http://192.168.1.100:4566"
    lambda = "http://192.168.1.100:4566"
    rds = "http://192.168.1.100:4566"
    redshift = "http://192.168.1.100:4566"
    route53 = "http://192.168.1.100:4566"
    s3 = "http://192.168.1.100:4566"
    secretsmanager = "http://192.168.1.100:4566"
    ses = "http://192.168.1.100:4566"
    sns = "http://192.168.1.100:4566"
    sqs = "http://192.168.1.100:4566"
    ssm = "http://192.168.1.100:4566"
    stepfunctions = "http://192.168.1.100:4566"
    sts = "http://192.168.1.100:4566"
  }
}
