provider "aws" {
  region = "us-east-1"
}

resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "vault_test_bucket" {
  bucket = "devsecops-vault-demo-${random_id.bucket_suffix.hex}"

  tags = {
    Name        = "Vault Dynamic Secret Test"
    Environment = "Dev"
    ManagedBy   = "Terraform"
  }
}

output "bucket_name" {
  value = aws_s3_bucket.vault_test_bucket.id
}
