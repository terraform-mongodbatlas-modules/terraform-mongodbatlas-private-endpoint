locals {
  private_endpoints = flatten([for connection_string in mongodbatlas_advanced_cluster.geosharded.connection_strings : connection_string.private_endpoint])

  connection_strings_east = [
    for private_endpoint in local.private_endpoints : private_endpoint.srv_connection_string
    if contains([for endpoint in private_endpoint.endpoints : endpoint.endpoint_id], module.aws-private-link-us-east-1.vpc_endpoint_id)
  ]

  connection_strings_west = [
    for private_endpoint in local.private_endpoints : private_endpoint.srv_connection_string
    if contains([for endpoint in private_endpoint.endpoints : endpoint.endpoint_id], module.aws-private-link-us-west-1.vpc_endpoint_id)
  ]
}

output "connection_string_east" {
  value = length(local.connection_strings_east) > 0 ? local.connection_strings_east[0] : ""
}

output "connection_string_west" {
  value = length(local.connection_strings_west) > 0 ? local.connection_strings_west[0] : ""
}
