variable "region" {
  description = "Please enter region to deploy server"
  type        = string
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "Please enter instance type"
  type        = string
  default     = "t3.micro"
}

variable "ami" {
  default = "ami-03a71cec707bfc3d7"
}

variable "allow_ports" {
  description = "List of ports to open"
  type        = list(any)
  default     = ["80", "443", "8080", "1541", "9092", "9093", "22"]
}

variable "cidr_blocks" {
  description = "List cidr bloks"
  type        = list(any)
  default     = ["0.0.0.0/0"]
}

variable "enable_monitoring" {
  default = "true"
}

variable "common_tags" {
  description = "Common tags to all resources"
  type        = map(any)
  default = {
    Owner   = "Andrii sereda"
    Projekt = "WebAcademy"
  }
}
