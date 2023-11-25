resource "aws_s3_bucket" "example" {
    bucket = "my-tf-test-bucket1303"

    tags = {
        Name        = "My bucket"
        Environment = "Dev"
    }
}