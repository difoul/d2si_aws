resource "aws_security_group" "from_home" {
  name = "from_home"
  description = "Only me!"
  vpc_id = "${aws_vpc.vpcTR.id}"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["X.X.X.X/X"]
  }

  egress {
      from_port = 0
      to_port = 65535
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "from_public" {
  name = "from_public"
  description = "Only public subnets!"
  vpc_id = "${aws_vpc.vpcTR.id}"

  ingress {
      from_port = 22
      to_port = 22
      protocol = "tcp"
      cidr_blocks = ["${aws_subnet.publicsubnet01TR.cidr_block}" , "${aws_subnet.publicsubnet02TR.cidr_block}"]
  }

  egress {
      from_port = 0
      to_port = 65535
      protocol = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_instance" "bastion" {
    ami = "${var.default_ami}"
	key_name = "${var.key_name}"
	subnet_id = "${aws_subnet.publicsubnet01TR.id}"
	security_groups = ["${aws_security_group.from_home.id}"]
    instance_type = "t2.micro"
    tags {
        Name = "Bastion"
    }
}
resource "aws_instance" "privateInstance" {
    ami = "${var.default_ami}"
	key_name = "${var.key_name}"
	subnet_id = "${aws_subnet.privatesubnet01TR.id}"
	security_groups = ["${aws_security_group.from_public.id}"]
    instance_type = "t2.micro"
    tags {
        Name = "PrivateInstance"
    }
}