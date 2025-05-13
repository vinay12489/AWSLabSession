resource "aws_vpc" "vpc" {
  cidr_block       = "192.168.0.0/16"
  instance_tenancy = "default"
  tags = {
    Name     = "Vinay-Lab-VPC"
    Env      = "production"
    Project  = "JHC-Lab"
    Location = "Benguluru"
  }

}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "Lab_IGW"
  }

}
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "192.168.1.0/24"
  tags = {
    Name = "Public_Subnet"
  }

}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }

  tags = {
    Name = "public-rt"
  }
}
/**
#create Elastic IP Address
resource "aws_eip" "EIP" {
  domain = "vpc"
  tags = {
    Name = "Lab_EIP"
  }

}
resource "aws_nat_gateway" "NAT" {
  allocation_id = aws_eip.EIP.id
  subnet_id     = aws_subnet.public_subnet.id
  tags = {
    Name = "NAT-Gateway"
  }

}
resource "aws_route_table" "private_rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block      = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NAT.id
  }

}
resource "aws_route_table_association" "private_art" {
    subnet_id = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private_rt.id
  
}

resource "aws_instance" "public_sever" {
    ami = "ami-062f0cc54dbfd8ef1"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.public_subnet.id
    tags = {
      Name = "Bastion_Host_Sever"
    }
  
}

resource "aws_instance" "private_sever" {
    ami = "ami-062f0cc54dbfd8ef1"
    instance_type = "t2.micro"
    subnet_id = aws_subnet.private_subnet.id
    tags = {
      Name = "App Server"
    }
  
}

**/
resource "aws_route_table_association" "public_art" {
    subnet_id = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_rt.id
  
}
