provider "aws" {
	access_key = "${var.aws_access_key}"
	secret_key = "${var.aws_secret_key}"
	region = "${var.aws_region}"
}
resource "aws_vpc" "vpcTR" {
    cidr_block = "${var.vpc_cidr}"
    tags {
        Name = "vpcTerraform"
    }
	enable_dns_support = false
	enable_dns_hostnames = false
}
resource "aws_subnet" "publicsubnet01TR" {
    vpc_id = "${aws_vpc.vpcTR.id}"
    cidr_block = "${var.publicsubnet01_cidr}"
	availability_zone = "${var.aws_region}a"
	map_public_ip_on_launch = true
	#availability_zone = "${element(lookup(var.aws_azs , var.aws_region) , 0}"

    tags {
        Name = "PublicSubnet01"
    }
}
resource "aws_subnet" "publicsubnet02TR" {
    vpc_id = "${aws_vpc.vpcTR.id}"
    cidr_block = "${var.publicsubnet02_cidr}"
	availability_zone = "${var.aws_region}b"
	map_public_ip_on_launch = true
	#availability_zone = "${element(lookup(var.aws_azs , var.aws_region) , 1}"

    tags {
        Name = "PublicSubnet02"
    }
}
resource "aws_subnet" "privatesubnet01TR" {
    vpc_id = "${aws_vpc.vpcTR.id}"
    cidr_block = "${var.privatesubnet01_cidr}"
	availability_zone = "${var.aws_region}a"
	#availability_zone = "${element(lookup(var.aws_azs , var.aws_region) , 0}"

    tags {
        Name = "PrivateSubnet01"
    }
}
resource "aws_subnet" "privatesubnet02TR" {
    vpc_id = "${aws_vpc.vpcTR.id}"
    cidr_block = "${var.privatesubnet02_cidr}"
	availability_zone = "${var.aws_region}b"
	#availability_zone = "${element(lookup(var.aws_azs , var.aws_region) , 1}"

    tags {
        Name = "privateSubnet02"
    }
}
resource "aws_internet_gateway" "igwTR" {
    vpc_id = "${aws_vpc.vpcTR.id}"

    tags {
        Name = "InternetGatewayTR"
    }
}
resource "aws_route_table" "publicRouteTableTR" {
    vpc_id = "${aws_vpc.vpcTR.id}"
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igwTR.id}"
    }
    tags {
        Name = "PublicRouteTable"
    }
}
resource "aws_route_table_association" "public01" {
    subnet_id = "${aws_subnet.publicsubnet01TR.id}"
    route_table_id = "${aws_route_table.publicRouteTableTR.id}"
}
resource "aws_route_table_association" "public02" {
    subnet_id = "${aws_subnet.publicsubnet02TR.id}"
    route_table_id = "${aws_route_table.publicRouteTableTR.id}"
}