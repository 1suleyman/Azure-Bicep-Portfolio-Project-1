# 🌩️ Azure-Bicep-Portfolio-Project-1  
**Build a Real-World Cloud Infrastructure Project with Azure Bicep**

---

## 🎯 Project Overview

This portfolio project demonstrates my ability to build and manage cloud infrastructure using **Azure Bicep**, Microsoft's Infrastructure as Code (IaC) language. It reflects real-world patterns like modular deployment, conditional resources, and environment-aware configurations.

The scenario simulates launching a multi-region toy company application with secure backend services, auditing, and optional content delivery — all built using best practices for IaC.

---

## 🛠️ Technologies Used

- **Azure Bicep** – Infrastructure as Code
- **Azure App Service** – Web hosting
- **Azure SQL** – Database backend
- **Azure Storage** – CDN origin and static content
- **Azure CDN** – Optional content delivery
- **Azure Virtual Network** – Environment isolation
- **GitHub Actions** – CI/CD (optional bonus)
- **VS Code + Bicep Extension** – Authoring tools

---

## 📦 Architecture Summary

This project provisions:

✅ One or more **Azure SQL Servers** across multiple regions  
✅ Virtual networks with subnet separation (frontend/backend)  
✅ Optional **Azure CDN** for content delivery  
✅ Modular, reusable Bicep files (`app`, `cdn`, `database`)  
✅ Output of server FQDNs for use in CI/CD or DNS  
✅ Support for **development and production** environments with conditional auditing  
✅ Infrastructure as Code — no manual portal configuration

---

## 📋 Task Checklist

This repo follows a structured learning progression from Exercises 1–9 (and beyond). Here's the task breakdown:

### 🔨 Core Tasks

- [x] Define parameters, variables, decorators, and expressions in Bicep
- [x] Create reusable modules (App Service, CDN, SQL Server)
- [x] Deploy with conditions (e.g., auditing only in production)
- [x] Use `for`-loops to deploy resources across multiple regions
- [x] Store secrets securely via Azure Key Vault
- [x] Use `output` expressions to expose resource data
- [x] Enable optional deployment of a CDN using `if()` logic

### 🧪 Bonus (Advanced, Optional)

- [ ] Integrate GitHub Actions to deploy infra on push  
- [ ] Enable CI to run Bicep validation and preview  
- [ ] Track infra drift using `what-if`  
- [ ] Write a blog post to reflect on the process and learnings

---

## 📁 Repo Structure

```
Azure-Bicep-Portfolio-Project-1/
│
├── main.bicep                  # Entry point for full environment
├── main.parameters.dev.json    # Parameters for Dev environment
├── main.parameters.prod.json   # Parameters for Prod environment
│
└── modules/
    ├── app.bicep               # App Service and Plan
    ├── cdn.bicep               # CDN Profile and Endpoint
    └── database.bicep          # SQL Server, Database, Auditing
```

---

## 🚀 Deployment Instructions

```bash
# 1. Install CLI tools
az bicep install && az bicep upgrade
az login

# 2. Create the resource group
az group create --name BicepRG --location westus

# 3. Deploy the environment (Dev or Prod)
az deployment group create \
  --resource-group BicepRG \
  --name main \
  --template-file main.bicep \
  --parameters main.parameters.dev.json
```

---

## 🧠 What I Learned

- Modularizing Bicep code for clarity and reusability
- Using loops and conditions to handle complex deployments
- Managing secrets securely via Key Vault references
- Structuring real-world IaC projects in a scalable way
- Deploying regionally-distributed infrastructure with Bicep

## 📘 License

This project is for personal learning and portfolio purposes.
```
