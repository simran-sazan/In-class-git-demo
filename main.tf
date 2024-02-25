# resource "aws_eip" "example" {
#   domain = "vpc"
#   tags = {
#     Name = "eip_tf"
#   }
# }

# data "aws_eips" "example" {
# }

# output "public_ips" {
#   value = data.aws_eips.example.public_ips
# }


# resource "aws_security_group" "sg_tf" {
#   name        = "security-group-terraform"
#   description = "Application Security Group"
#   depends_on  = [aws_eip.example]

#   ingress {
#     from_port   = var.from_port
#     to_port     = var.to_port
#     protocol    = var.protocol
#     cidr_blocks = ["${aws_eip.example.public_ip}/32"]
#   }
#   egress {
#     from_port   = var.from_port
#     to_port     = var.to_port
#     protocol    = var.protocol
#     cidr_blocks = ["0.0.0.0/0"]
#   }

#   tags = {
#     Name = "security-group-terraform"
#   }
# }



//Datatypes
# resource "aws_instance" "myec2" {
#     ami = "ami-082b5a644766e0e6f"
#     instance_type = var.types.key[0]
#  }

//Count parameter
# resource "aws_instance" "instance-1" {
#    ami = "ami-0440d3b780d96b29d"
#    instance_type = "t2.micro"
#    count = 3
# }

//Foreach

# # toset( ["user-01","user-02", "user-03"] )  --> sample set 

# resource "aws_iam_user" "iam" {
#   for_each = toset(["user-01","user-02", "user-03"])
#   name = each.key
# }


# #map 
# #{
# #       key1 = "t2.micro"
# #       key2 = "t2.medium"
# #    }

# resource "aws_instance" "myec2" {
# ami = "ami-0cea098ed2ac54925"
# for_each = {
#       key1 = "t2.micro"
#       key2 = "t2.medium"
#    }
# instance_type    = each.value
#   key_name         = each.key
#   tags =  {
#    Name = each.value
#     }
# }

//CREATE BEFORE DESTROY

# resource "aws_instance" "myec2" {
#     ami = "ami-0f34c5ae932e6f0e4"
#     instance_type = "t2.micro"

#     tags = {
#         Name = "Sample-ec2"
#     }
# }

# resource "aws_instance" "myec2" {
#     ami = "ami-0440d3b780d96b29d" //ami changed
#     instance_type = "t2.micro"

#     tags = {
#         Name = "Sample-ec2"
#     }

#     lifecycle {
#       create_before_destroy = true
#     }
# }


# // PREVENT DESTROY
# resource "aws_instance" "preventdestroy" {
#     ami = "ami-0f34c5ae932e6f0e4"
#     instance_type = "t2.micro"

#     tags = {
#         Name = "prevent_destroy"
#     }

#     # lifecycle {
#     #   prevent_destroy = true
#     # }
# }

# // CONDITIONAL EXPRESSIONS

# variable "istest" {
#   default = false
# }

# resource "aws_instance" "dev" {
#   ami = "ami-082b5a644766e0e6f"
#   instance_type = "t2.micro"
#   count = var.istest == true ? 3:0
# }

# resource "aws_instance" "prod" {
#   ami = "ami-082b5a644766e0e6f"
#   instance_type = "t2.micro"
#   count = var.istest == false ? 3:0
# }