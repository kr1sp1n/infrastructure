resource "aws_ecs_task_definition" "simple_service" {
    family = "simple_service"
    container_definitions = "${file("task-definitions/simple_service.json")}"
}
