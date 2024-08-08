locals {
  private_endpoints = flatten([for connection_string in mongodbatlas_advanced_cluster.cluster.connection_strings : connection_string.private_endpoint])

  connection_strings = [
    for private_endpoint in local.private_endpoints : private_endpoint.srv_connection_string
    if contains([for endpoint in private_endpoint.endpoints : endpoint.endpoint_id], module.aws-private-link-cluster.vpc_endpoint_id)
  ]
}

output "connection_string" {
  value = length(local.connection_strings) > 0 ? local.connection_strings[0] : ""
}
