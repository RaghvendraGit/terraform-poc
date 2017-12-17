# Configure the AWS Provider
provider "aws" {
access_key = "${var.aws_access_key}"
secret_key = "${var.aws_secret_key}"
region = "us-east-1"
}

data "aws_security_group" "sec_group" {
  id = "${var.security_group_id}"
}

output "security_group_name" { value = "${data.aws_security_group.sec_group.name}" }
output "vpc_id" { value = "${data.aws_security_group.sec_group.vpc_id}" }
output "sg-description" { value = "${data.aws_security_group.sec_group.description}" }


data "aws_instance" "fetch_instance_details" {
instance_id = "${var.instance_id}"
}

output "public-IP-Associated" { value = "${data.aws_instance.fetch_instance_details.associate_public_ip_address}" }
output "Availablilty-Zone" { value = "${data.aws_instance.fetch_instance_details.availability_zone}" }
output "instance-Type" { value = "${data.aws_instance.fetch_instance_details.instance_type}" }
output "Key-Name" { value = "${data.aws_instance.fetch_instance_details.key_name}" }
output "Public-IP" { value = "${data.aws_instance.fetch_instance_details.public_ip}" }
output "private-IP" { value = "${data.aws_instance.fetch_instance_details.private_ip}" }
output "security_groups" { value = "${data.aws_instance.fetch_instance_details.security_groups}" }
