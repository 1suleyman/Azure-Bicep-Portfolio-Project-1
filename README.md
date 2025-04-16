# 🌩️ Azure Bicep Portfolio Project: Toy Launch Infrastructure 🚀  
**A hands-on, real-world Infrastructure-as-Code (IaC) project built with Azure Bicep**

---

## 🧠 Introduction

After completing several guided Azure Bicep exercises (01–09), I wanted to push myself further by applying everything I’d learned into a standalone, production-inspired project. This is that project.

I treated it like I would a real-world client scenario: a multi-region toy company launching a new product (our fictional “Smart Teddy Bear”), needing secure, scalable infrastructure — with clean code, environment-aware deployments, and modular architecture.

This was more than just deploying a few services. I wrote reusable modules, tested conditional logic, looped deployments across regions, and exposed outputs — all in Bicep. Plus, I learned how to make it look great on a resume too 😉

---

## 🗺️ Scenario Summary

Imagine a toy company launching their product website and backend across multiple Azure regions. Some environments (like **Production**) need added compliance features (like **auditing**, **VNet integration**, and a **CDN**) — while others (like **Development**) do not.

**As the cloud engineer,** my job was to:

✅ Build that infrastructure using Infrastructure as Code  
✅ Ensure it's environment-aware (Prod vs Dev)  
✅ Keep the code clean, modular, and scalable  

---

## 🔧 Technologies I Used

- 🏗️ **Azure Bicep** – Main IaC language
- 🖥️ **Azure App Service** – Host the web app
- 🧠 **Azure SQL** – App database backend
- 📦 **Azure Storage** – Static content + CDN origin
- 📡 **Azure CDN** – (Optional) Content delivery
- 🌐 **Azure Virtual Network** – Subnet separation
- 🔒 **Azure Key Vault** – Secure secrets management
- 💻 **Visual Studio Code** – Dev environment
- 🧪 **GitHub Actions** – CI/CD (Bonus task)

---

## 🏗️ Architecture at a Glance

This project deploys the following cloud resources:

| Component | Details |
|----------|---------|
| SQL Servers | One in each region, secured & optionally audited |
| Virtual Networks | Separate subnets for frontend/backend |
| App Service | Hosted web app with HTTPS |
| CDN | Only deployed for production |
| Key Vault | Secrets stored securely via references |
| Outputs | Hostnames (FQDNs) exposed for DevOps use |

Everything is deployed using **modular** Bicep files and **parameterized** for easy re-use.

---

## 🧱 File Structure

```
Azure-Bicep-ToyCompany-Infrastructure/
│
├── main.bicep                  # Root deployment file
├── main.parameters.dev.json    # Parameters for Dev
├── main.parameters.prod.json   # Parameters for Prod
│
└── modules/
    ├── app.bicep               # App Service & Plan
    ├── cdn.bicep               # CDN Profile & Endpoint (optional)
    └── database.bicep          # SQL Server, DB, Auditing
```

---

## ✅ Features I Built

- [x] Modularized infrastructure with reusable components
- [x] Conditional deployment (`if()` statements) for environments
- [x] For-each loops to deploy resources to multiple regions
- [x] Secure secret handling with Azure Key Vault references
- [x] Output expressions for FQDNs and resource names
- [x] Virtual Network creation with dynamic subnet definitions
- [x] Optional CDN setup for Production
- [x] JSON parameter files for environment-specific deployments

---

## 🚀 How to Deploy It Yourself

```bash
# Install Azure Bicep CLI (if not installed)
az bicep install && az bicep upgrade

# Log into Azure
az login

# Create a resource group
az group create --name BicepRG --location westus

# Deploy the Dev environment
az deployment group create \
  --resource-group BicepRG \
  --name main-dev \
  --template-file main.bicep \
  --parameters main.parameters.dev.json

# Deploy the Production environment
az deployment group create \
  --resource-group BicepRG \
  --name main-prod \
  --template-file main.bicep \
  --parameters main.parameters.prod.json
```

---

## 💡 What I Learned

This wasn’t just about syntax — it was about strategy.

Here's what I gained from this hands-on build:

- **Breaking down infrastructure** into reusable modules
- **Thinking environment-first**: Dev ≠ Prod
- **Looping deployments** across regions in a clean, scalable way
- **Using `if()` & decorators** to control behavior and improve security
- **Understanding outputs** for real-world automation and DevOps
- **Simulating real team requirements** — not everything is always needed (like a CDN)

---

## 🧪 Bonus Goals (In Progress)

- [ ] CI/CD using GitHub Actions for infra changes
- [ ] Automated testing for Bicep templates (`what-if`, `validate`)
- [ ] Write a blog post about the lessons learned
- [ ] Bonus: Deploy a frontend app and wire up DNS

---

## 🗒️ Want to Learn From Me?

This project is documented step-by-step so others can follow along too.  
If you’re breaking into cloud engineering or DevOps, this is a great place to start.

Feel free to fork this repo, tweak the design, or reach out to connect.  
**Let’s grow together.**

---

## 📣 Let’s Connect!

**👋 I'm Suleyman – Cloud Learner, Builder, Sharer.**  
If you're working on a similar project or breaking into Azure too, let’s connect on [LinkedIn](linkedin.com/in/suleyman-m-a74768221).
