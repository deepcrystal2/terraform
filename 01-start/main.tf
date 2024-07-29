provider "local" {

}

provider "aws" {
  region = "ap-northeast-2"
}

resource "local_file" "foo" {
  content  = "Hello World"
  filename = "${path.module}/foo.txt"
}

data "local_file" "bar" {
  filename = "${path.module}/bar.txt"
}

output "file_bar" {
 value = data.local_file.bar
}

resource "aws_vpc" "test" {
  cidr_block = "10.123.0.0/16"
  tags = {
    "Name" = "This is test VPC"
  }

}

output "vpc_test" {
 value = aws_vpc.test
}

data "aws_vpcs" "this" {
}

output "vpcs" {
  value = data.aws_vpcs.this
}

