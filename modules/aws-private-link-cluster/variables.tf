variable "project_id" {
  description = "The project id (e.g., 65def6ce0f722a1507105bb5)."
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC for the endpoint to use."
  type        = string
}

variable "subnet_ids" {
  description = "The ID of one or more subnets in which to create a network interface for the endpoint."
  type        = list(string)
}

variable "security_group_ids" {
  description = "The ID of one or more security groups to associate with the network interface. If no security groups are specified, the VPC's default security group is associated with the endpoint."
  type        = list(string)
  default     = null
  nullable    = true
}
