#!/usr/bin/env bash

TERRAFORM_VERSION="0.13.4"
TERRAGRUNT_VERSION="0.25.2"

echo "Installing Terraform ${TERRAFORM_VERSION}..."
# TODO should validate against SHA256SUMS at https://releases.hashicorp.com/terraform/0.13.4/terraform_0.13.4_SHA256SUMS
wget -q https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip -O /tmp/terraform.zip
mkdir /usr/share/terraform-${TERRAFORM_VERSION}
unzip /tmp/terraform.zip -d /usr/share/terraform-${TERRAFORM_VERSION}
ln -s /usr/share/terraform-${TERRAFORM_VERSION}/terraform /usr/bin/terraform
echo Done.

echo "Installing Terragrunt ${TERRAGRUNT_VERSION}..."
mkdir /usr/share/terragrunt-${TERRAGRUNT_VERSION}
wget -q https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_amd64 -O /usr/share/terragrunt-${TERRAGRUNT_VERSION}/terragrunt
chmod +x /usr/share/terragrunt-${TERRAGRUNT_VERSION}/terragrunt
ln -s /usr/share/terragrunt-${TERRAGRUNT_VERSION}/terragrunt /usr/bin/terragrunt
echo Done.