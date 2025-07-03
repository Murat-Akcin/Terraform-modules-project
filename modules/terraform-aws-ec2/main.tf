resource "aws_instance" "main" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]
  key_name               = var.key_name
  user_data              = var.user_data
  tags = {
    Name        = "${var.name}-${var.environment}"
    Environment = var.environment
  }
}