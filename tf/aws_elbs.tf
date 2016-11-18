resource "aws_elb" "simple_service_elb" {
    name = "simple-service-elb"
    subnets = ["${module.vpc.public_subnets}"]
    connection_draining = true
    cross_zone_load_balancing = true
    security_groups = [
        "${aws_security_group.allow_cluster.id}",
        "${aws_security_group.allow_all_inbound.id}",
        "${aws_security_group.allow_all_outbound.id}"
    ]

    listener {
        instance_port = 8000
        instance_protocol = "http"
        lb_port = 80
        lb_protocol = "http"
    }

    health_check {
        healthy_threshold = 2
        unhealthy_threshold = 10
        target = "HTTP:8000/"
        interval = 5
        timeout = 4
    }
}
