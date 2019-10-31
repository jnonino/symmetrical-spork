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

plan: ## Plan Infrastructure
		echo "Plan infrastructure" && \
		cd $(TERRAFORM_AWS_DIR) && \
		terraform plan

deploy: ## Deploy Infrastructure
		echo "Deploy infrastructure" && \
		cd $(TERRAFORM_AWS_DIR) && \
		terraform apply

test: ## Test infrastructure
		@echo "Run the tests"

cleanup: ## Cleanup Infrastructure
		echo "Cleanup infrastructure" && \
		cd $(TERRAFORM_AWS_DIR) && \
		terraform destroy