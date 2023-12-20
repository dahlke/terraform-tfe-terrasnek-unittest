provider "tfe" {
  hostname = "app.terraform.io"
}

variable "email" {
  type = string
}

variable "org_name" {
  type = string
}

data "tfe_organization" "org" {
  name = "${var.org_name}"
}

resource "tfe_variable_set" "test" {
  name          = "Test Varset"
  description   = "Some description."
  organization  = tfe_organization.org.name
}

output "org_id" {
  value = "${tfe_organization.org.id}"
}