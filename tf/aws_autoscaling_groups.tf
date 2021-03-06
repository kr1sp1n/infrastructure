resource "template_file" "user_data" {
    template = "templates/user_data"
    vars {
        cluster_name = "ecs-dev"
    }
}

resource "aws_iam_instance_profile" "ecs" {
    name = "ecs-profile"
    roles = ["${aws_iam_role.ecs.name}"]
}

resource "aws_launch_configuration" "ecs_cluster" {
    name = "ecs_cluster_conf"
    instance_type = "t2.micro"
    image_id = "${lookup(var.ami, var.aws_region)}"
    iam_instance_profile = "${aws_iam_instance_profile.ecs.id}"
    security_groups = [
        "${aws_security_group.allow_all_ssh.id}",
        "${aws_security_group.allow_all_outbound.id}",
        "${aws_security_group.allow_cluster.id}",
    ]
    user_data = "${template_file.user_data.rendered}"
    key_name = "${aws_key_pair.test.key_name}"
}

resource "aws_autoscaling_group" "ecs_cluster" {
    name = "ecs-cluster"
    vpc_zone_identifier = ["${module.vpc.public_subnets}"]
    min_size = 0
    max_size = 3
    desired_capacity = 3
    launch_configuration = "${aws_launch_configuration.ecs_cluster.name}"
    health_check_type = "EC2"
}
