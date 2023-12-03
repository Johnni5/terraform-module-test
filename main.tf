terraform {
  required_providers {
       aws = {
      source = "hashicorp/aws"
      version = "5.29.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"
}

module "dbserver" {
  source = "./db-server"
  dbname = "Name from Module"
}

module "webserver" {
  source = "./web-server"
  webname = "Name from Module"
}

module "vpc" {
  source = "./vpc"
}

module "secgroup" {
  source = "./secgroup"
  sec_port_range = var.sec_port_range
}
