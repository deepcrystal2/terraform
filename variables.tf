// vpc cidr block

variable "vpc_cidr" {
  default = "10.0.0.0/16"
  description = "vpc cidr block"
  type = string
}

// public subnet cidr block 1

variable "public_subnet_1" {
  default = "10.0.1.0/24"
  description = "public subnet cidr block 1"
  type = string
}

// public subnet cidr block 2

variable "public_subnet_2" {
  default = "10.0.2.0/24"
  description = "public subnet cidr block 2"
  type = string
}

// private subnet cidr block 1 | app-tier

variable "private_app_subnet_1" {
  default = "10.0.3.0/24"
  description = "private-app-subnet 1"
  type = string
}

// private subnet cidr block 2 | app-tier

variable "private_app_subnet_2" {
  default = "10.0.4.0/24"
  description = "private-app-subnet 2"
  type = string
}

// private subnet cidr block 1 | db-tier

variable "private_db_subnet_1" {
  default = "10.0.5.0/24"
  description = "private-db-subnet 1"
  type = string
}

// private subnet cidr block 2 | db-tier

variable "private_db_subnet_2" {
  default = "10.0.6.0/24"
  description = "private-db-subnet 2"
  type = string
}

// bastion sg
variable "ssh_locate" {
  default = "0.0.0.0/0"
  description = "allow access from anywhere"
  type = string
}