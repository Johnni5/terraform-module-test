output "db_priv_ip" {
  value = module.dbserver.aws_instance.db_server.private_ip
}
