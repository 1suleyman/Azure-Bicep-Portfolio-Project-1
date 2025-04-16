# 🌩️ Azure Bicep Portfolio Project – Multi-Region App Infrastructure

**Build scalable, secure, and modular Azure infrastructure using Bicep — from scratch.**

---

## 🎯 Overview

This is a **hands-on, real-world Infrastructure as Code (IaC) project** using **Azure Bicep** — designed not only to solidify your learning but also to serve as a **portfolio-quality deployment** for recruiters and a guide for other learners.

You'll act as the Infrastructure Engineer for a global toy company rolling out a new multi-region app. Your mission: build cloud-native infrastructure that’s modular, secure, environment-aware, and production-ready — all using Azure-native tooling.

> 📢 Whether you're showcasing your cloud skills, studying for certification, or preparing for DevOps interviews — this project is your proving ground.

---

## 🌍 Real-World Scenario

Your company is launching a new **smart teddy bear** app in several countries. The app requires:

- Secure backend services (SQL)
- High availability (multi-region)
- VNet isolation (frontend/backend)
- Scalable hosting (App Service)
- Optional CDN acceleration (via toggle)
- Secret handling with Key Vault
- Dev and Prod environment separation

---

## 🧰 Technologies & Services

| Technology             | Purpose                                     |
|------------------------|---------------------------------------------|
| **Azure Bicep**        | Infrastructure as Code                      |
| **Azure App Service**  | Hosting the app frontend                    |
| **Azure SQL Database** | Regional data storage                       |
| **Azure Key Vault**    | Secure secret storage                       |
| **Azure CDN** (optional) | Website acceleration                       |
| **Azure VNet/Subnets** | Network isolation                           |
| **GitHub Actions**     | CI/CD pipeline (bonus)                      |
| **VS Code + Bicep**    | Authoring + validation                      |

---

## 🧠 What You’ll Practice

✅ Real-world IaC with modular Bicep files  
✅ Deploying across **multiple Azure regions** using loops  
✅ Controlling resources with `if()` conditions  
✅ Creating **reusable modules** for App, DB, and CDN  
✅ Managing secrets with Key Vault references  
✅ Using outputs to share info between modules or pipelines  
✅ Structuring IaC projects for scale and clarity

---

## 🗂️ File Structure

```
azure-bicep-portfolio/
│
├── main.bicep                     # Root deployment file
├── main.parameters.dev.json       # Parameters for Dev
├── main.parameters.prod.json      # Parameters for Prod
│
└── modules/
    ├── app.bicep                  # App Service and Plan
    ├── cdn.bicep                  # CDN Profile and Endpoint
    └── database.bicep             # SQL Server, DB, Auditing
```

---

## 🚀 Project Setup & Deployment

### ✅ Step 1: Install Tools

```bash
az bicep install && az bicep upgrade
az login
```

### ✅ Step 2: Create Resource Group

```bash
az group create --name BicepRG --location westus
```

### ✅ Step 3: Deploy to Development

```bash
az deployment group create \
  --resource-group BicepRG \
  --name dev-deployment \
  --template-file main.bicep \
  --parameters main.parameters.dev.json
```

### ✅ Step 4: Deploy to Production

```bash
az deployment group create \
  --resource-group BicepRG \
  --name prod-deployment \
  --template-file main.bicep \
  --parameters main.parameters.prod.json
```

---

## 🧪 What to Look For

- [x] Are **App Service** and **SQL Database** deployed per region?
- [x] Is **auditing enabled** in `prod` but not in `dev`?
- [x] Is the **CDN deployed conditionally** based on the `deployCdn` flag?
- [x] Are **outputs** (e.g., FQDNs) available after deployment?
- [x] Are **networks isolated** using VNet + Subnets?
- [x] Is **secret data pulled securely** from Key Vault?

---

## 🧠 Bonus Challenges (Level Up)

| Challenge                      | Notes |
|-------------------------------|-------|
| [ ] Setup GitHub Actions for infra CI/CD  | Push to `main` → Deploy |
| [ ] Add `az deployment what-if` validation | Preview before applying |
| [ ] Deploy App content via pipeline       | Automate app zip deploy |
| [ ] Purge CDN on content update           | Force refresh |
| [ ] Track drift or use `az bicep lint`    | Stay in sync |
| [ ] Add a blog post to document it        | Showcase your learning journey |

---

## 📘 Learning Outcomes

At the end of this project, you’ll be able to:

- Build **multi-region Bicep templates**
- Use **loops, conditions, decorators, outputs**
- Reference **Key Vault secrets securely**
- Understand modularization in IaC
- Communicate infra design clearly — to peers *and* employers

--

## 🗒️ Want to Learn From Me?

This project is documented step-by-step so others can follow along too.  
If you’re breaking into cloud engineering or DevOps, this is a great place to start.

Feel free to fork this repo, tweak the design, or reach out to connect.  
**Let’s grow together.**

---

## 📣 Let’s Connect!

**👋 I'm Suleyman – Cloud Learner, Builder, Sharer.**  
If you're working on a similar project or breaking into Azure too, let’s connect on [LinkedIn](https://www.linkedin.com/in/your-profile).
