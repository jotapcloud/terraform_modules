
variable "vpc_cidr_block" {
  type        = string
  description = "Define VPC CIDR block"
}

variable "project_name" {
  type        = string
  description = "Define Project Name"
}

variable "env" {
  type = string
}

variable "tags" {
  type = map(string)
}

variable "create_customer_gateway" {
  type    = bool
  default = false
  description = "Define to whether create or not the customer gateway"
}


variable "customer_gateway_name" {
  type     = string
  default  = "cgw"
}

variable "customer_gateway_bgp_asn" {
  type     = string
  default  = 65000
}

variable "customer_gateway_ip_address" {
  type     = string
  default = "172.83.124.10"
}

variable "customer_gateway_type" {
  type     = string
  default = "ipsec.1"
}

variable "customer_gateway_certificate_arn" {
  type     = string
  default = null
}

variable "customer_gateway_device_name" {
  type     = string
  default = null
}

variable "customer_gateways" {
  description = "Maps of Customer Gateway's attributes (BGP ASN and Gateway's Internet-routable external IP address)"
  type        = map(map(any))
  default     = {}
}