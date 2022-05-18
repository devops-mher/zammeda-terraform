init-stage:
	terraform init -backend=true -upgrade -reconfigure \
		-backend-config="bucket=image-store-bucket-stage" \
		-backend-config="prefix=zammad-stage.tfstate"

init-prod:
	terraform init -backend=true -upgrade -reconfigure \
		-backend-config="bucket=image-store-bucket-prod" \
		-backend-config="prefix=zammad-prod.tfstate"

plan-stage:
	terraform plan -var-file=stage.tfvars

plan-prod:
	terraform plan -var-file=prod.tfvars

apply-stage:
	terraform apply -var-file=stage.tfvars

apply-prod:
	terraform apply -var-file=prod.tfvars
build:
	terraform init -backend=true -upgrade -reconfigure -backend-config="bucket=image-store-bucket-prod" -backend-config="prefix=zammad-prod.tfstate" && terraform apply -var-file=prod.tfvars -auto-approve && terraform init -backend=true -upgrade -reconfigure -backend-config="bucket=image-store-bucket-stage" -backend-config="prefix=zammad-stage.tfstate" && terraform apply -var-file=stage.tfvars -auto-approve

login:
	gcloud auth application-default login