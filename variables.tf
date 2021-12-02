variable "account_id" {
  description = "Id of the AWS account to assume role. It is a TF cloud variable, coming from the master workspace"
  type        = string
}

variable "region" {
  description = "The default region in which we build infrastructure. It is a TF cloud variable, coming from the master workspace"
  type        = string
}

variable "env" {
  description = "The current env. It is a TF cloud variable, coming from the master workspace"
  type        = string
}

variable "vpn_cidr_block" {
  description = "The CIDR range for clients connected to the VPN"
  type        = string
  default     = "10.0.0.0/16"
}

variable "cidr" {
  description = "The CIDR range for clients connected to the VPN"
  type        = string
  default     = "10.1.0.0/16"
}

variable "azs" {
  description = "The AZS for the central VPN"
  type        = list(string)
  default     = ["eu-central-1a", "eu-central-1b"]
}

variable "private_subnets" {
  description = "The subnets for the central VPN"
  type        = list(string)
  default     = ["10.1.4.0/23", "10.1.68.0/23"]
}

variable "remote_vpcs" {
  description = "ID and CIDR ranges for the remote VPC, with which we would like peer the cental VPN VPC"
  type        = map
  default = {
    dev = {
      vpc_id     = "vpc-0b9b1d62a516f67fe"
      cidr       = "10.2.0.0/16"
      peering_id = "pcx-09c31096561163f6b"
    }
  }
}


