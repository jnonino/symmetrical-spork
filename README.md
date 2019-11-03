# symmetrical-spork

Deploy service with AWS Fargate using terraform

## Directory layout

    .
    ├── scripts                            # scripts to run terraform & tests
    ├── terraform
      - aws                                # Terraform AWS infrastructure
    ├── tests                              # Infrastructure tests
    ├── Makefile                           # Set of tasks to execute
    └── README.md                          # Documentation

## Proposed Infrastructure Architecture

![design](design.jpg "Architecture")

* AWS Fargate
* AWS Application Load Balancer

The application load balancer should have an `/service` endpoint and `/__healthcheck__` health check endpoint.

If something is missing, feel free adding it to a solution.

## Objectives

The task objectives were as follows:

* Create infrastructure-as-code as per proposed Architecture
* Test Infrastructure (you can choose one or more test frameworks)
	* [Terraform BDD Testing](https://github.com/eerkunt/terraform-compliance)
	* [Terraform Unit Testing](https://github.com/bsnape/rspec-terraform)
	* [Terraform Ultimate Testing](https://github.com/bsnape/rspec-terraform)
* `Makefile` has all the commands requred to run/test
* Explain how to run and test in `README.md`

## Deploy

The infrastructure of this project was created using terraform. In order to deploy it the following commands are available:

        $ make plan
        $ make deploy

With the first one, terraform plan command is executed, which is used to create an execution plan (https://www.terraform.io/docs/commands/plan.html).

With the second one, terraform apply command is executed, which is used to apply the changes required to reach the desired state of the configuration (https://www.terraform.io/docs/commands/apply.html).

## Test the whole setup

### Terraform Compliance
    
Python should be installed. Then install Terraform Compliance.

        $ pip install terraform-compliance

Run tests

        $ make test-tf-compliance

## Note

Please do not make pull requests. Fork/Clone the repo instead and work on it.

There is no need to deploy infrastructure to AWS. Just make sure it fully valid terraform infrastructure-as-code setup and it has sufficient level of tests.
