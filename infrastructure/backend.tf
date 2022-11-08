terraform {
  backend "s3" {
    bucket = "group-3-talent-academy-elk-project"
    key    = "kibana-ami/terraform.tfstates"
    dynamodb_table = "terraform-lock"
  }
}