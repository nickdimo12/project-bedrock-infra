# 🛠️ Retail Store Sample App on AWS EKS

This project provisions a complete Kubernetes-based microservices application on **Amazon EKS**, automated with **Terraform** and deployed using **GitHub Actions CI/CD**.

---

## 📑 Table of Contents
1. [Repository Structure](#repository-structure)
2. [Architecture Overview](#architecture-overview)
3. [Deployment Guide](#deployment-guide)
4. [Access Instructions](#access-instructions)

---

## 📂 Repository Structure

```plaintext
.
├── infra/               # Infrastructure as Code (EKS, VPC, Nodegroups, etc.)
├── .github/workflows/       # GitHub Actions CI/CD pipelines
├── k8s-manifests/           # Custom Kubernetes YAMLs (Deployments, Services, Ingress)
├── README.md                # Deployment & Architecture Guide (this file)


🏗️ Architecture Overview

Amazon EKS Cluster: Managed Kubernetes control plane.

Node Group: Worker nodes running container workloads.

Networking: VPC with private/public subnets and security groups.

CI/CD:

terraform-plan.yml → Runs on feature branches (shows infra changes).

terraform-apply.yml → Runs on main branch (applies infra + deploys app).

🚀 Deployment Guide
1. Clone the Repository
git clone https://github.com/nickdimo12/retail-store-sample-app.git
cd retail-store-sample-app

2. Initialize Terraform
cd terraform
terraform init
terraform plan
terraform apply

3. Deploy Kubernetes Manifests
kubectl apply -f k8s-manifests/

4. Access Instructions

The UI service is exposed via a Kubernetes Ingress → AWS ALB (Application Load Balancer).

Find the ALB URL:

kubectl get ingress -n ui


Open the URL in your browser to access the application.

 IAM Developer Credentials

A read-only IAM user has been created for developers.

To configure AWS CLI with their credentials:

aws configure --profile dev-readonly


Update your ~/.kube/config to include:

aws eks update-kubeconfig --name <cluster-name> --region <your-region> --profile dev-readonly

 Notes

In production:

Restrict IAM permissions.

