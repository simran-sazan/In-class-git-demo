variable "from_port" {
  default = 442
}

variable "to_port" {
  default = 443
}

variable "protocol" {
  default = "tcp"
}

#   variable "list" {
#    type = list
#    default = ["m5.large","m5.xlarge","t2.medium"]
#    //index = {0,1,2}
#  }

#   variable "types" {
#    type = map
#    default = {
#      us-east-1 = "t2.micro"
#      us-west-2 = "t2.nano"
#      ap-south-1 = "t2.small"
#    }
#  }