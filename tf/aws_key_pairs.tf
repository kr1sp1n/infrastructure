resource "aws_key_pair" "test" {
    key_name = "test-key"
    public_key = "${file("public_keys/test-key")}"
}
