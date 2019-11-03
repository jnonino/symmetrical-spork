#!/bin/bash

set -euo pipefail

echo "Run Terraform Compliance tests"

CURRENT_DIR=$(cd "$(dirname $0)"; pwd)
ROOT_DIR=$(cd "${CURRENT_DIR}/.."; pwd)

FEATURES_DIR=tests/tf-compliance
TERRAFORM_PLAN_OUT_FILE=terraform/aws/plan.out

terraform-compliance --features ${FEATURES_DIR} --planfile ${TERRAFORM_PLAN_OUT_FILE}