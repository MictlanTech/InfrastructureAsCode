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
  default =  ["sg-0fb0d7e2d2f550617", "sg-03bab8135a0dcefd2", "sg-012b4de795344411b"]
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
