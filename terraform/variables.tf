#-----------------------------------------------------------------------------------------------------------------------------
# Variables
# This section defines all the variables that are being passed from terraform.tfvars and all the environment specific files. 
#-----------------------------------------------------------------------------------------------------------------------------
variable "assume_role_arn" {}
variable "bucket_name" {}
variable "component" {}
variable "environment" {}
variable "region" {}
variable "security_group_tag_name" {}
variable "subnet_prefix" {}
variable "tag_resource_name" {}
variable "vpc_name" {}

// Database variables
variable "db_allocated_storage" {}
variable "db_apply_immediately" {}
variable "db_availability_zones" {}
variable "db_engine" {}
variable "db_engine_version" {}
variable "db_final_snapshot_identifier" {}
variable "db_master_username" {}
variable "db_master_password" {}
variable "db_name" {}
variable "db_publicly_accessible" {}
variable "db_instance_class" {}
variable "db_instance_identifier" {}
variable "db_skip_final_snapshot" {}
variable "db_subnet_group_name" {}
variable "db_subnet_name" {}
variable "db_subnets" {}
