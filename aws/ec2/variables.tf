variable "name" {
  description = "the instance name"
  type        = string
}

variable "ami" {
  description = "the ami to use"
  type        = string
}

variable "instance_type" {
  description = "the ec2 instance type"
  type        = string
}

variable "ingress_rules" {
  description = "Ingress rules to create"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = optional(list(string))
  }))
}

variable "egress_rules" {
  description = "Egress rules to create"
  type = map(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = optional(list(string))
  }))
}

variable "busy_box_port" {
  description = "the port to host busybox on"
  type        = number
}

variable "algorithm" {
  description = "The algorithm used to generate the key"
  type        = string
  default     = "RSA"
}

variable "filename" {
  description = "The filename in which to store the ky locally"
  type        = string
  default     = "mykey.pem"
}

variable "file_permission" {
  description = "The numeric representation of the file permission"
  type        = number
  default     = 400
}