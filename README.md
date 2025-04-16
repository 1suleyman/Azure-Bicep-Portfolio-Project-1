# 🌍 Azure Bicep Multi-Region Cloud Infrastructure Project

## 🔍 Overview

This project simulates the **launch of a global toy company’s cloud infrastructure**, designed entirely with **Azure Bicep** – Microsoft's Infrastructure as Code (IaC) solution. The system supports multiple environments (Dev/Prod), multi-region deployments, secure backend services, and optional content delivery via Azure CDN. It mirrors enterprise cloud architecture patterns and demonstrates modular, reusable IaC practices.

## ✅ Key Features

### 🚀 Infrastructure Deployment
- **Multi-region SQL Server deployments** for scalability and resilience
- **Environment-based logic** for deploying different resources in Dev vs Prod
- **Conditional auditing and CDN deployment** using `if()` statements
- **Virtual networks with subnet segmentation** for frontend/backend traffic isolation
- **Visitor-ready App Service Website** hosted securely with HTTPS
- **Output logic** to surface hostnames (FQDNs) for integration or monitoring

### ⚙️ Modularity & Reusability
- All infrastructure is structured into self-contained **Bicep modules**:
  - `app.bicep` → App Service + Plan  
  - `database.bicep` → SQL Server, DB, auditing logic  
  - `cdn.bicep` → CDN Profile + Endpoint (optional)  

### 🔐 Security
- Secrets like SQL login credentials are **referenced securely from Azure Key Vault**
- Sensitive parameters are flagged with the `@secure()` decorator

### 🧠 Smart Logic
- **Loops** (`for`) used to deploy the same resource across regions
- **Variable loops** for subnet configuration
- **Output loops** to capture regional FQDNs of deployed services

---

## 🧰 Tools & Technologies

| Tool               | Purpose                                |
|--------------------|----------------------------------------|
| **Azure Bicep**    | Define, deploy, and manage resources   |
| **Azure App Service** | Host production web app              |
| **Azure SQL**      | Provide a secure backend database      |
| **Azure Storage**  | Serve static content and logs          |
| **Azure CDN**      | Improve performance (Prod only)        |
| **Azure VNet**     | Isolate environments via subnetting    |
| **Azure Key Vault**| Secure secret management               |
| **VS Code + Bicep Extension** | Dev environment              |
| **GitHub Actions** (Optional) | CI/CD integration            |

---

## 🗂️ Project Structure

```
Azure-Bicep-Portfolio-Project/
│
├── main.bicep                     # Root template (Dev/Prod switch)
├── main.parameters.dev.json       # Parameters for development
├── main.parameters.prod.json      # Parameters for production
│
└── modules/
    ├── app.bicep                  # App Service & Plan logic
    ├── database.bicep             # SQL Server, DB, and auditing
    └── cdn.bicep                  # CDN Profile and Endpoint
```

---

## 🧪 Workflow Summary

### 💡 Phase 1: Modular Infra Design
- Split infrastructure into dedicated Bicep modules
- Use decorators (`@description`, `@allowed`, `@secure`) to improve parameter clarity
- Create conditional logic for Prod-only deployments (e.g., auditing)

### 💡 Phase 2: Multi-Region Deployment
- Define an array of Azure regions (e.g., `westus`, `eastus2`, `eastasia`)
- Loop over regions to deploy SQL servers and VNETs
- Use outputs to capture and return all FQDNs from deployed SQL servers

### 💡 Phase 3: CDN Integration (Optional)
- Add a toggle (`deployCdn`) to optionally deploy Azure CDN
- Dynamically point CDN to the App Service output as its origin
- Set HTTPS enforcement on the CDN endpoint

---

## 📦 Deployment Instructions

```bash
# 1. Install dependencies
az bicep install && az bicep upgrade
az login

# 2. Create a Resource Group
az group create --name BicepRG --location westus

# 3. Deploy (Dev or Prod)
az deployment group create \
  --resource-group BicepRG \
  --name main \
  --template-file main.bicep \
  --parameters main.parameters.dev.json
```

---

## 📊 Results

- 🚀 **Fully deployed cloud stack** across multiple Azure regions
- 🔐 **Secure database infrastructure** with conditional auditing
- 🌐 **Optional CDN integration** to serve content securely and faster
- 🧱 **Scalable, modular architecture** for future extensions

---

## 📚 What I Learned

- Architecting infrastructure using **modular Bicep design patterns**
- Creating **regionally distributed resources** with `for` loops
- Using **output expressions** and Key Vault references in production deployments
- Applying **real-world IaC best practices** for environment separation
- Improving **project maintainability** through reuse and abstraction

---

## 🚧 Future Enhancements

- [ ] Add **CI/CD with GitHub Actions** for automated validation and deployment
- [ ] Implement **ARM template testing (`what-if`)** for change previews
- [ ] Write a **Dev.to blog** to reflect on technical decisions & learning journey
- [ ] Integrate **monitoring tools** for audit visibility and health checks

---

## 📘 License

This project is open source and free to use for educational and portfolio purposes.

