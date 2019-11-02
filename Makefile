.EXPORT_ALL_VARIABLES:

.NOTPARALLEL:

.PHONY: help terraform

help:
	@cat Makefile* | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

TERRAFORM_AWS_DIR=terraform/aws

init: ## Init Terraform folder
		echo "Init terraform folder" && \
		cd $(TERRAFORM_AWS_DIR) && \
		terraform init && \
		terraform get

plan: init ## Plan Infrastructure
		echo "Plan infrastructure" && \
		cd $(TERRAFORM_AWS_DIR) && \
		terraform plan -out=plan.out

deploy: init ## Deploy Infrastructure
		echo "Deploy infrastructure" && \
		cd $(TERRAFORM_AWS_DIR) && \
		terraform apply

terraform-compliance: plan ## Test infrastructure
		@scripts/terraform_compliance_tests.sh

cleanup: init ## Cleanup Infrastructure
		echo "Cleanup infrastructure" && \
		cd $(TERRAFORM_AWS_DIR) && \
		terraform destroy
