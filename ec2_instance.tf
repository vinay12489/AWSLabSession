resource "aws_instance" "ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.public_subnet.id
   # availability_zone = var.availability-zon
    count = var.instance_count
    monitoring = var.enable_monitoring
    sta
    disable_api_termination = var.aws_terminate_instance
    tags = {
      Name= "Linux Server"
      Name="linux"
    }
}
