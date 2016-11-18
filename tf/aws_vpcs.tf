module "vpc" {
    source = "github.com/terraform-community-modules/tf_aws_vpc"
    name = "ecs-vpc"
    cidr = "10.0.0.0/16"
    public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]
    map_public_ip_on_launch = "false"
    azs = ["eu-central-1a", "eu-central-1b"]
}
