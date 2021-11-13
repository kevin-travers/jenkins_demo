#Configure the AWS Provider
 provider "aws" {
    region  = var.region
}

#set up state file for bucket
terraform {
  backend "s3" {
    bucket         = "msc-aspera-cloud-tf-state-uat-us-east-1-177709074364"
    key            = "jenkins/s3_bucket/terraform.tfstate"
    region         = "us-east-1"
    dynamodb_table = "msc-aspera-cloud-tf-locks-uat"
    encrypt        = true
  }
}

data "aws_iam_policy_document" "custom_policy" {
    statement {
      sid    = "Allow logs access"
      effect = "Allow"
      principals {
        type        = "Service"
        identifiers = ["logs.us-east-1.amazonaws.com"]
      }
      actions   = ["s3:GetBucketAcl"]
      resources = ["arn:aws:s3:::msc-aspera-test-uat-177709074364"]
    }
  }
  

#create s3 bucket usign module
module "s3_bucket" {
    source      = "github.com/kevin-travers/Terraform_Modules/AWS/S3_Bucket"
    bucket_name = "msc-aspera-test-uat-177709074364"
    custom_policy = data.aws_iam_policy_document.custom_policy.json
    requried_tags = var.requried_tags
}


module "sg" {
    source      = "github.com/kevin-travers/Terraform_Modules/AWS/Secuirty_group"
    security_group_name = "test_name"
    requried_tags = var.requried_tags
    vpc_id = "vpc-0e9465bf3ef90faeb"
    description = "testing"
    ingress_rules = [
        {
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = []
            description = "allow ec2 in group to ssh into each other"
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = true
        },
        {
            from_port = 33001
            to_port = 33011
            protocol = "tcp"
            cidr_blocks = ["10.127.2.0/24"]
            description = "workspace access"
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
        }
    ]
        egress_rules = [
        {
            from_port = 22
            to_port = 22
            protocol = "tcp"
            cidr_blocks = []
            description = "allow ec2 in group to ssh into each other"
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = true
        },
        {
            from_port = 33001
            to_port = 33333
            protocol = "tcp"
            cidr_blocks = ["10.127.2.0/24"]
            description = "workspace access"
            ipv6_cidr_blocks = []
            prefix_list_ids = []
            security_groups = []
            self = false
        }
    ]
}
