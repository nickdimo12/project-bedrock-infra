# 🏗️ Project Bedrock Infra — EKS Infrastructure & App Deployment

This repository automates the provisioning of a complete **Amazon EKS (Elastic Kubernetes Service)** environment and deployment of a retail sample microservices app using **Terraform** and **GitHub Actions**.

---

## 🚀 Overview

- **Infrastructure as Code:** Managed using Terraform.
- **Deployment:** Automated through GitHub Actions CI/CD workflows.
- **Kubernetes Workloads:** Defined in the `k8s/` folder.
- **AWS Services Used:**
  - Amazon EKS
  - Amazon S3 (Terraform state)
  - DynamoDB (state locking)
  - IAM roles for automation (OIDC and GitHub Actions)
  - Application Load Balancer for ingress traffic

---

## 🧩 Folder Structure

| Folder | Description |
|--------|--------------|
| `.github/workflows/` | CI/CD automation pipelines for Terraform and Kubernetes deployment. |
| `infra/` | Terraform code to provision VPC, EKS cluster, and node groups. |
| `k8s/` | Kubernetes manifests for app deployments and services. |

---

## ⚙️ Prerequisites

- AWS account with permissions for EKS, S3, IAM, and DynamoDB
- GitHub OIDC role configured (`github-actions-terraform-role`)
- Terraform `>= 1.5.0`
- kubectl and AWS CLI installed
- S3 bucket and DynamoDB table for backend state

---

## 🪜 Deployment Steps

### 1️⃣ Clone the repository
```bash
git clone https://github.com/nickdimo12/project-bedrock-infra.git
cd project-bedrock-infra

2️⃣ Initialize Terraform
cd infra
terraform init
terraform plan
terraform apply

3️⃣ Configure kubectl
aws eks update-kubeconfig --region eu-west-1 --name bedrock-eks


4️⃣ Deploy Kubernetes resources
kubectl apply -f k8s/namespace-retail.yaml
kubectl apply -f k8s/mysql-secret.yaml
kubectl apply -f k8s/mysql-deployment.yaml
kubectl apply -f k8s/mysql-service.yaml
kubectl apply -f k8s/ui-deployment.yaml
kubectl apply -f k8s/ui-service.yaml

🔁 CI/CD Workflows
Workflow	Description	Trigger
terraform-plan.yml	Runs terraform plan on pull requests.	PRs to main
terraform-apply.yml	Applies Terraform and deploys app.	Merge to main
deploy.yaml	Unified deploy pipeline for EKS + app rollout.	Push or manual trigger



🔒 Security & IAM Setup

OIDC provider: token.actions.githubusercontent.com

IAM role: github-actions-terraform-role

Attached policies:

AmazonEKSClusterPolicy

AmazonEKSWorkerNodePolicy

AmazonEKS_CNI_Policy

AmazonEC2ContainerRegistryReadOnly

AmazonS3FullAccess

AmazonDynamoDBFullAccess

🌐 Accessing the App

After deployment, find your ALB ingress endpoint:

kubectl get ingress -n retail


Open the listed URL in your browser to access the Retail Store UI.

👨‍💻 Maintainer

Nick Dimo
📧 Email: [elodimoebuka@yahoo.com]
🌍 AWS EKS + DevOps Infrastructure Automation.
