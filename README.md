# Azure VM Landing Zone with Terraform & DevSecOps

## 📌 Project Overview

This project demonstrates the implementation of an **Azure Landing Zone** using **Terraform Infrastructure as Code (IaC)**.

The infrastructure is designed using a **parent-child Terraform module architecture**, where reusable child modules are called from the parent module to provision Azure resources.

The project also integrates **DevSecOps and cost-analysis tools** to improve infrastructure security, code quality, and cost visibility.

---

## 🏗️ Architecture

The Azure infrastructure includes the following components:

- Azure Resource Groups
- Virtual Network
- Subnets
- Network Security Groups
- Public IP
- Network Interface
- Virtual Machines
- Azure Bastion
- NAT Gateway
- Application Gateway
- Azure Key Vault

### Architecture Diagram

![Azure Landing Zone Architecture](./architecture.png)

> The editable Draw.io source file is available in the repository as `Security Tools Results.drawio`.

---

## 🛠️ Technologies & Tools

| Category | Tools |
|----------|-------|
| Cloud | Microsoft Azure |
| Infrastructure as Code | Terraform |
| Version Control | Git / GitHub |
| Security | GitLeaks, tfsec |
| Terraform Linting | TFLint |
| Cost Estimation | Infracost |
| Scripting | Azure CLI, PowerShell |
| Diagramming | Draw.io |

---

## 📂 Project Structure

```text
azure_landing_zone/
│
├── child_module/
│   ├── azurerm_app_gateway/
│   ├── azurerm_bastion/
│   ├── azurerm_key_vault/
│   ├── azurerm_nat_gateway/
│   ├── azurerm_nic/
│   ├── azurerm_public_ip/
│   ├── azurerm_resource_group/
│   ├── azurerm_subnet/
│   ├── azurerm_virtual_machine/
│   └── azurerm_virtual_network/
│
├── parent_module/
│   ├── main.tf
│   ├── provider.tf
│   ├── variable.tf
│   ├── terraform.tfvars
│   ├── .gitleaks.toml
│   ├── gitleaks-report.json
│   ├── tfsec-report.json
│   ├── tflint-report.json
│   └── infracost-report.json
│
├── Security Tools Results.drawio
├── .gitignore
└── README.md