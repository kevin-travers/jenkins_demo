#Configure the AWS Provider
 provider "aws" {
    region  = var.region
}
module "s3_bucket" {
    source      = "github.com/kevin-travers/Terraform_Modules/AWS/S3_Bucket"
    bucket_name = "msc-aspera-test-uat-177709074364"
}
