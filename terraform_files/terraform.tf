terraform{
	required_providers{
		aws={
		source="hashicorp/aws"
		version="~> 5.0"
		}		
	}
	backend "s3"{
		bucket="admin-tf-state"
		key="terraform.tfstate"
		region="ap-south-1"
	}
}
