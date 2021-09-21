region            = eu-central-1
instance_type     = t3.micro
allow_ports       = ["80", "443", "8080", "1541", "9092", "9093", "22"]
enable_monitoring = false
common_tags = {
  Owner   = "Andrii sereda"
  Projekt = "WebAcademy"
}
