#Configure the AWS Provider
 provider "aws" {
    region  = var.region
}

#set up state file
terraform {
  backend "s3" {
    bucket         = "msc-aspera-cloud-tf-state-uat-us-east-1-177709074364"
    key            = "jenkins/s3_bucket/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "msc-aspera-cloud-tf-locks-uat"
    encrypt        = true
  }
}
module "s3_bucket" {
    source      = "github.com/kevin-travers/Terraform_Modules/AWS/S3_Bucket"
    bucket_name = "msc-aspera-test-uat-177709074364"
}
