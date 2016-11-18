variable "github_user" {}
variable "github_token" {}
variable "github_organization" {}

provider "github" {
    token = "${var.github_token}"
    organization = "${var.github_organization}"
}

# Add a user to the organization
#resource "github_membership" "membership_for_new_user" {
#    username = "${var.github_user}"
#    role = "member"
#}
