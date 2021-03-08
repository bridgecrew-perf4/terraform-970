resource "random_pet" "test" {
  count = var.env == "qa" ? 1 : 0
}

output "module_pet_name_value" {
  value = random_pet.test[*].id
}