#---------------------------------------------------------
# Provider and assume role configuration
#---------------------------------------------------------

provider "aws" {
  region = var.region
  assume_role {
    role_arn = var.assume_role_arn
  }
}

#---------------------------------------------------------
# Cloud Provider
# The region is necesary in most operations we do in AWS.
# If we don't supply here terraform will ask explicitly.
#---------------------------------------------------------
# Data source to get the access to the effective Account ID, User ID, and ARN in which Terraform is authorized.
data "aws_caller_identity" "current" {}

data "aws_vpc" "vpc" {
  tags = {
    Name = var.vpc_name
  }
}

data "aws_subnet_ids" "subnet_ids" {
  tags = {
    Name = var.subnet_prefix
  }
  vpc_id = data.aws_vpc.vpc.id
}

data "aws_security_groups" "deere_inbound" {
  filter {
    name = "tag:Name"
    values = [var.security_group_tag_name]
  }
  filter{
    name ="vpc-id"
    values = [data.aws_vpc.vpc.id]
  }
}

# Create db subnets
resource "aws_db_subnet_group" "db_subnet" {
  name        = var.db_subnet_name
  description = "DB Subnet for RDS instance"
  subnet_ids  = var.db_subnets
  // Mandatory for billing
  tags = {
    Name        = var.tag_resource_name
    Environment = var.environment
    component = var.component
  }
}

# Create a db instance
resource "aws_db_instance" "default" {
  engine                     = var.db_engine
  engine_version             = var.db_engine_version
  instance_class             = var.db_instance_class
  identifier                 = var.db_instance_identifier
  name                       = var.db_name
  username                   = var.db_master_username
  password                   = var.db_master_password
  allocated_storage          = var.db_allocated_storage
  apply_immediately          = var.db_apply_immediately
  publicly_accessible        = var.db_publicly_accessible
  db_subnet_group_name       = aws_db_subnet_group.db_subnet.name
  vpc_security_group_ids     = data.aws_security_groups.deere_inbound.ids
  skip_final_snapshot        = true
  // Mandatory for billing
  tags = {
    Name        = var.tag_resource_name
    Environment = var.environment
    component = var.component
  }
}