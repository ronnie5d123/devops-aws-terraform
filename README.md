# AWS Infrastructure Platform using Terraform

A modular Infrastructure as Code (IaC) project that provisions a secure, reusable AWS environment using Terraform. The project demonstrates AWS networking, compute, IAM, storage security, and infrastructure lifecycle management.

## Architecture

The project provisions the following AWS resources:

- **Amazon VPC:** Custom network using CIDR `10.0.0.0/16`.
- **Public and private subnets:** Distributed across two Availability Zones.
- **Internet Gateway and route tables:** Enable internet routing for public subnets while private subnets have no direct internet route.
- **Amazon EC2:** Amazon Linux 2023 instance running Nginx.
- **Security groups:** SSH access restricted to the current public IP, with HTTP and HTTPS ingress rules.
- **AWS IAM:** EC2 role and instance profile with Systems Manager permissions.
- **Amazon S3:** Versioned bucket with server-side encryption, public-access blocking, and bucket-owner-enforced object ownership.
- **Terraform modules:** Separate modules for networking, compute, IAM, and storage.

> Note: Private subnets currently have no NAT Gateway or other outbound internet route. The EC2 instance is deployed in a public subnet.

## Project Structure

```text
devops-aws-terraform/
├── modules/
│   ├── network/
│   ├── compute/
│   ├── iam/
│   └── storage/
├── main.tf
├── providers.tf
├── variables.tf
├── outputs.tf
├── moved.tf
├── network-module.tf
├── compute-module.tf
├── iam-module.tf
├── storage-module.tf
├── .gitignore
├── .terraform.lock.hcl
└── README.md
```

Each module contains its own `main.tf`, `variables.tf`, and `outputs.tf` files.

## Prerequisites

- An AWS account with appropriate permissions.
- AWS CLI configured with credentials.
- Terraform installed.
- Git installed.

The project currently uses the AWS provider in the `~> 6.0` version range and deploys to `us-east-1`.

## SSH Public Key Configuration

The EC2 key pair is configured through the required Terraform variable `public_key`. The public key is read locally and passed to Terraform at plan/apply time; private SSH keys must never be committed to the repository.

For Git Bash, use your existing public key:

```bash
terraform plan -var="public_key=$(cat ~/.ssh/devops-aws-project.pub)"
```

Review the proposed changes before applying:

```bash
terraform apply -var="public_key=$(cat ~/.ssh/devops-aws-project.pub)"
```

These commands assume the public key file exists at the specified path. If you use a different key, provide the corresponding public-key value instead.


## Deployment

Clone the repository and enter the project directory:

```bash
git clone <YOUR_GITHUB_REPOSITORY_URL>
cd devops-aws-terraform
```

Initialize Terraform:

```bash
terraform init
```

Format and validate the configuration:

```bash
terraform fmt -recursive
terraform validate
```

Preview infrastructure changes:

```bash
terraform plan
```

After reviewing the plan, deploy the infrastructure:

```bash
terraform apply
```

Type `yes` only after reviewing the proposed changes.

## View Outputs

Retrieve the deployment details:

```bash
terraform output
terraform output app_public_ip
terraform output ec2_instance_id
terraform output s3_bucket_name
terraform output vpc_id
```

Open the EC2 public IP in a browser to test the Nginx landing page:

```text
http://<EC2_PUBLIC_IP>
```

The instance's public IP may change if the instance is replaced or its public IPv4 address changes.

## Security Practices

- Block all forms of public S3 bucket access.
- Enable S3 versioning to retain previous object versions.
- Enable AES-256 server-side encryption for S3 objects.
- Enforce bucket-owner-controlled object ownership.
- Encrypt the EC2 root EBS volume.
- Restrict SSH ingress to the current public IP.
- Use an EC2 IAM role instead of storing AWS credentials on the instance.
- Keep Terraform state files, secrets, and SSH private keys out of version control.

**Security improvement to consider:** HTTP and HTTPS ingress are currently open to the internet. For a production deployment, restrict access where appropriate and consider placing the application behind an Application Load Balancer with managed TLS.

## Validation and Testing

The project has been validated using Terraform formatting, configuration validation, and execution plans.

Additional verification includes:

- Checking VPC routing and subnet associations.
- Confirming EC2 instance deployment and Nginx availability.
- Verifying S3 public-access blocking, encryption, ownership controls, and versioning.
- Testing S3 versioning by uploading multiple versions of an object.
- Using Terraform `moved` blocks to reorganize resources into modules without recreating existing infrastructure.
- GitHub Actions automatically checks Terraform formatting, initializes the configuration without configuring a remote backend, and validates the Terraform configuration on pushes and pull requests targeting main or master.

## Cost Considerations

This project uses a small EC2 instance and avoids NAT Gateways and managed databases to limit costs.

AWS may still charge for EC2 compute, EBS storage, public IPv4 addresses, and S3 storage or requests. Review the AWS pricing applicable to your account and region.

Stop or destroy resources when they are no longer needed. Stopping EC2 does not eliminate all storage or public IPv4 costs.

## Cleanup

Review the destruction plan before removing resources:

```bash
terraform plan -destroy
```

If you intend to remove the infrastructure, first back up anything you need and handle all versioned S3 objects and delete markers appropriately. S3 buckets containing objects or object versions may prevent bucket deletion.

Then run:

```bash
terraform destroy
```

Review the proposed deletions and confirm only when you intend to remove the infrastructure.

## Skills Demonstrated

**AWS | Terraform | Infrastructure as Code | VPC | Subnets | Route Tables | EC2 | IAM | S3 | Security Groups | Linux | Nginx | Git | Infrastructure State Management**