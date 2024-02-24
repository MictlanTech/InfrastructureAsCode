terraform {
    backend "s3" {
        bucket = "tf-state-mictlan-117"
        key    = "dev_env/terraform_state"
        region = "us-east-1"
    # Optionally, if you want to use a specific AWS profile from your AWS credentials file:
        # profile        = "myprofile"
    # Or, if you prefer to hardcode the credentials (not recommended for security reasons):
        # access_key     = "myaccesskey"
        # secret_key     = "mysecretkey"

    # If you are using AWS KMS for encryption:
        # encrypt        = true
        # kms_key_id     = "alias/my-kms-key" # Replace with your KMS Key ID

    # If your S3 bucket requires server-side encryption:
        # sse_customer_key = "my-server-side-encryption-key"

    # For state locking and consistency checking
        #dynamodb_table = "my-terraform-locks"  # Replace with your DynamoDB table name
        
        
    }
}