.SHELL := /usr/bin/bash
.PHONY: apply destroy-backend destroy destroy-target plan-destroy plan plan-target prep
VARS="secrets/secrets.tfvars"
BOLD=$(shell tput bold)
RED=$(shell tput setaf 1)
GREEN=$(shell tput setaf 2)
YELLOW=$(shell tput setaf 3)
RESET=$(shell tput sgr0)
PROJECT_ROOT=$(shell pwd)
TIMESTAMP=$(shell date +%s)
WORKSPACE=$(shell basename $(PROJECT_ROOT))

help: ## help message
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

init: ## initialize the terraform workspace
	@echo "WORKSPACE set to $(WORKSPACE)"
	@terraform init \
		-input=false \
		-lock=true \
		-upgrade \
		-verify-plugins=true
	@echo "$(BOLD) switching to workspace $(WORKSPACE)$(RESET)"
	@terraform workspace select $(WORKSPACE) || terraform workspace new $(WORKSPACE)

apply: ## terraform apply
	@terraform apply \
		-lock=true\
		-input=false\
		-refresh=true\
		-var-file="$(VARS)"

plan: ## terraform plan
	@terraform plan \
		-lock=true \
		-input=false \
		-refresh=true \
		-out=terraform.plan.$(TIMESTAMP) \
		-var-file="$(VARS)"

plan-target: ## terraform plan with a specific target
	@echo "$(YELLOW)$(BOLD)[INFO]   $(RESET)"; echo "Example to type for the following question: module.rds.aws_route53_record.rds-master"
	@read -p "PLAN target: " DATA && \
		terraform plan \
			-lock=true \
			-input=true \
			-refresh=true \
			-target=$$DATA \
			-var-file="$(VARS)"

plan-destroy: ## terraform plan destory
	@echo does nothing
	@terraform plan \
		-input=false \
		-refresh=true \
		-out=terraform.plan.destroy.$(TIMESTAMP) \
		-destroy \
		-var-file="$(VARS)"

destroy: ## terraform destroy
	@terraform destroy \
		-lock=true \
		-input=false \
		-refresh=true \
		-var-file="$(VARS)"

destroy-target: ## terraform destroy
	@echo "$(YELLOW)$(BOLD)[INFO] Specifically destroy a piece of Terraform data.$(RESET)"; echo "Example to type for the following question: module.rds.aws_route53_record.rds-master"
	@read -p "Destroy target: " DATA && \
		terraform destroy \
		-lock=true \
		-input=false \
		-refresh=true \
		-var-files=$(VARS) \
		-target=$$DATA
