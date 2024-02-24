terraform {
    backend "s3" {
        bucket = "tf-state-117mictlan"
        key    = "dev_env/terraform_state"
        region = "us-east-1"
    }
}