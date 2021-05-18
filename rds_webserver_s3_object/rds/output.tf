output "address" { # rds endpoint
    value = aws_db_instance.rds-db.address
    description = "this is the  address of rds instance"
}
output "username" {
    value = aws_db_instance.rds-db.username
    description = "this is the  address of rds instance"
}
output "password" {
    value = aws_db_instance.rds-db.password
    description = "this is the  address of rds instance"
    sensitive = true 
}