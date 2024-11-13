# terraform-backend-s3

This terraform module creates an S3 bucket and a DynamoDB table to store and
version your terraform statefiles


```hcl
module "backend_s3" {
	source = "git::https://github.com/retornam/terraform-backend-s3.git?ref=main"
	environment = "production"
	region = "us-west-2"
	bucket = "example-bucket"
	name = "example-bucket-table"
	readcapacity = 2
	writecapacity = 2
}
```

## Makefile Targets

```
Available targets:
help:                             help message
init:                             initialize the terraform workspace
apply:                            terraform apply
plan:                             terraform plan
plan-target:                      terraform plan with a specific target
plan-destroy:                     terraform plan destory
destroy:                          terraform destroy
destroy-target:                   terraform destroy

```


## Inputs
| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| environment | prod/staging/ | string | null | yes |
| bucket | name of the bucket | string | null | yes |
| name | name of the KMS key and DynamoDB able | string | null | yes |
| readcapacity | the read capacity of the dynamodb table | string | null | yes |
| writecapacity | the write capacity of the dynamodb table | string | null | yes |


## Outputs

| Name | Description |
|------| ------------|
| bucket_arn |  The ARN of the bucket
| bucket_domain_name | The domain name of the bucket |
| bucket_regional_domain_name | The regional domain name of the bucket |
| dynamodb_arn |  The ARN of the Dynamodb   |
| dynamodb_id |  The name of thr Dynamodb    |
| kms_arn     |  The KMS key ARN \
| kms_alias_arn |  The ARN of the KMS Key Alias  |
| kms_key_id |  The KMS Key ID      |
