variable "dev_name"{
	type= list(string)
	default= ["dev1","dev2"]
}

resource "aws_instance" "dev"{
	count=length(var.dev_name)
	ami= "ami-007020fd9c84e18c7"
	instance_type= "t2.micro"
	key_name= "demo"
	subnet_id = "subnet-08616b079fcf7af79"
	tags={
	Name=var.dev_name[count.index]
	}
	metadata_options {
		http_endpoint= "enabled"
    		http_tokens= "required"
	}
}

output "ips"{
	value= [ for instance in aws_instance.dev: instance.public_ip ]
}
