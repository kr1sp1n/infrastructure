resource "aws_ecs_service" "simple_service" {
    name = "simple_service"
    cluster = "${aws_ecs_cluster.dev.id}"
    task_definition = "${aws_ecs_task_definition.simple_service.arn}"
    desired_count = 1
    iam_role = "${aws_iam_role.ecs_elb.arn}"
    depends_on = ["aws_iam_policy_attachment.ecs_elb"]

    load_balancer {
        elb_name = "${aws_elb.simple_service_elb.id}"
        container_name = "simple_service"
        container_port = 8000
    }
}
