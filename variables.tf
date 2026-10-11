variable "public_key" {
  description = "Public SSH key used for EC2 access"
  type        = string
  sensitive   = true
}