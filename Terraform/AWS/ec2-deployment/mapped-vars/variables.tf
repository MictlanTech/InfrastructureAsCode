variable "AWS_ACCESS_KEY" {
  type = string
  }

variable "AWS_SECRET_KEY" {
  type = string
  }

variable "AWS_REGION" {
    type = string
}

variable "InstanceCount" {
  type = number
  description = "The number of machines to be created"
  # Will be requested at Runtime
}

variable "Security_Groups" {
  type = list
  description = "Security groups to be assignes to the EC2 instances"
}

variable "AMIS" {
    type = map
    default = {
        us-east-1 = "ami-0440d3b780d96b29d"
        us-east-2 = "ami-02ca28e7c7b8f8be1"
        us-west-1 = "ami-07619059e86eaaaa2"
        us-west-2 = "ami-052c9ea013e6e3567"
    }
}
