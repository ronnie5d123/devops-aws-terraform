moved {
  from = aws_vpc.main
  to   = module.network.aws_vpc.main
}

moved {
  from = aws_internet_gateway.main
  to   = module.network.aws_internet_gateway.main
}

moved {
  from = aws_subnet.public_1
  to   = module.network.aws_subnet.public_1
}

moved {
  from = aws_subnet.public_2
  to   = module.network.aws_subnet.public_2
}

moved {
  from = aws_subnet.private_1
  to   = module.network.aws_subnet.private_1
}

moved {
  from = aws_subnet.private_2
  to   = module.network.aws_subnet.private_2
}

moved {
  from = aws_route_table.public
  to   = module.network.aws_route_table.public
}

moved {
  from = aws_route.public_internet
  to   = module.network.aws_route.public_internet
}

moved {
  from = aws_route_table_association.public_1
  to   = module.network.aws_route_table_association.public_1
}

moved {
  from = aws_route_table_association.public_2
  to   = module.network.aws_route_table_association.public_2
}

moved {
  from = aws_route_table.private
  to   = module.network.aws_route_table.private
}

moved {
  from = aws_route_table_association.private_1
  to   = module.network.aws_route_table_association.private_1
}

moved {
  from = aws_route_table_association.private_2
  to   = module.network.aws_route_table_association.private_2
}


moved {
  from = aws_security_group.ec2
  to   = module.compute.aws_security_group.ec2
}

moved {
  from = aws_vpc_security_group_ingress_rule.ec2_ssh
  to   = module.compute.aws_vpc_security_group_ingress_rule.ec2_ssh
}

moved {
  from = aws_vpc_security_group_ingress_rule.ec2_http
  to   = module.compute.aws_vpc_security_group_ingress_rule.ec2_http
}

moved {
  from = aws_vpc_security_group_ingress_rule.ec2_https
  to   = module.compute.aws_vpc_security_group_ingress_rule.ec2_https
}

moved {
  from = aws_vpc_security_group_egress_rule.ec2_all
  to   = module.compute.aws_vpc_security_group_egress_rule.ec2_all
}

moved {
  from = aws_instance.app
  to   = module.compute.aws_instance.app
}


moved {
  from = data.aws_iam_policy_document.ec2_assume_role
  to   = module.iam.data.aws_iam_policy_document.ec2_assume_role
}

moved {
  from = aws_iam_role.ec2
  to   = module.iam.aws_iam_role.ec2
}

moved {
  from = aws_iam_role_policy_attachment.ec2_ssm
  to   = module.iam.aws_iam_role_policy_attachment.ec2_ssm
}

moved {
  from = aws_iam_instance_profile.ec2
  to   = module.iam.aws_iam_instance_profile.ec2
}


moved {
  from = aws_s3_bucket.app
  to   = module.storage.aws_s3_bucket.app
}

moved {
  from = aws_s3_bucket_public_access_block.app
  to   = module.storage.aws_s3_bucket_public_access_block.app
}

moved {
  from = aws_s3_bucket_versioning.app
  to   = module.storage.aws_s3_bucket_versioning.app
}

moved {
  from = aws_s3_bucket_server_side_encryption_configuration.app
  to   = module.storage.aws_s3_bucket_server_side_encryption_configuration.app
}

moved {
  from = aws_s3_bucket_ownership_controls.app
  to   = module.storage.aws_s3_bucket_ownership_controls.app
}
