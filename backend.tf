terraform {
  backend s3 {
    bucket         = "jy-devops-terraform" // S3 버킷 이름
    key            = "backend-s3/terraform.tfstate" // tfstate 저장 경로
    region         = "ap-northeast-2"
    dynamodb_table = "terraform-tfstate-lock" // dynamodb table 이름
    encrypt =true
  }
}