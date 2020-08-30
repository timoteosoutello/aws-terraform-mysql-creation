# Env
environment = "devl"

# General values - roles/subnet/vpc
assume_role_arn = "arn:aws:iam::<iam_account_id>:<role>"
subnet_prefix = "<subnet_prefix>"
vpc_name = "<vpc_test>"

# Database subnets
db_subnet_name = "db-subnet"

# Database values
db_allocated_storage = 20
db_apply_immediately = true
db_availability_zones = ["sa-east-1"]
db_engine = "mysql"
db_engine_version = "8.0.20"
db_final_snapshot_identifier = "foo"
db_instance_identifier = "dbtest"
db_instance_class = "db.t2.micro"
db_master_username = "root"
db_master_password = "changeit"
db_name = "mysqlFreeDB"
db_publicly_accessible = true
db_skip_final_snapshot = false
db_subnets = ["<vpn_subnets>"]
db_subnet_group_name = "<vpn_subnet_group>"
