region            = eu-central-1
instance_type     = t2.micro
allow_ports       = ["80", "443", "22"]
enable_monitoring = false
common_tags = {
  Owner   = "Andrii sereda"
  Projekt = "WebAcademy"
}
