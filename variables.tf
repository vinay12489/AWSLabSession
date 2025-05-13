variable "ami_id" {
    description = "storing ami id"
    type = string
    default = "ami-062f0cc54dbfd8ef1"
  
}
variable "instance_type" {
    description = "instance type"
    type = string
    default = "t2.micro"
  
}
variable "availability-zon" {
    description = "availability-zone"
    type = string
    default = "ap-south-1a"

  
}
variable "instance_count" {
    description = "three instances"
    type = number
    default = 4
  
}
variable "enable_monitoring" {
    type = bool
    default = true
  
}
variable "aws_terminate_instance" {
    type = bool
    default = true
  
}
