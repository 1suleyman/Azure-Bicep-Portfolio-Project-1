# 🌍 Toyland Azure Infrastructure — Bicep Portfolio Project

## 🔍 Overview
This is a full-scale, **multi-region Azure infrastructure project** built using **Bicep**, Microsoft’s Infrastructure-as-Code (IaC) language.

The architecture simulates a global product launch for *Toyland* — a smart-toy company deploying apps, databases, virtual networks, and a global CDN. Each piece of infrastructure is modular, reusable, secure, and follows real-world patterns you'd use in a production environment.

---

## ✅ Key Concepts Demonstrated

- **Multi-region deployment** with looping logic (`for`)
- **Modular infrastructure** using Bicep modules
- **Environment-based conditional logic** (e.g., enable auditing in `prod`)
- **Secure credential handling** using `@secure` and (optionally) Key Vault
- **Optional resource deployment** using `if()` (e.g., CDN)
- **Clean, structured outputs** of URLs & FQDNs for integration

---

## 📁 Folder & File Structure

```
Azure-Bicep-Portfolio-Project/
│
├── main.bicep                   # Root template that wires everything together
├── main.parameters.dev.json    # Dev parameters (e.g., F1 SKU, no CDN)
├── main.parameters.prod.json   # Prod parameters (e.g., P1v2 SKU, auditing, CDN)
│
└── modules/
    ├── app.bicep               # App Service Plan + App Service
    ├── database.bicep          # SQL Server + DB (+ auditing in prod)
    ├── vnet.bicep              # VNet + frontend/backend subnets
    └── cdn.bicep               # Optional CDN profile + endpoint
```

---

## 🧱 What Each File Does

### `main.bicep` — 🧠 Orchestrator
- Accepts:
  - `locations` array
  - `sqlAdminLogin` / `sqlAdminPassword`
  - `environment` string (`dev` or `prod`)
  - `deployCdn` boolean
- Loops through regions to deploy:
  - `app.bicep`
  - `database.bicep`
  - `vnet.bicep`
- Conditionally deploys `cdn.bicep`
- Outputs:
  - Array of objects: region, app URL, SQL FQDN

---

### `modules/app.bicep` — 🌐 App Deployment
- Deploys:
  - App Service Plan
  - App Service
- Accepts:
  - `location`
  - `appServicePlanName`
  - `appName`
  - `appServicePlanSku` (`F1`, `P1v2`, etc.)
- Output:
  - Public App URL (FQDN)

---

### `modules/database.bicep` — 🗄️ SQL Server + DB
- Deploys:
  - SQL Server
  - SQL DB
  - Storage Account + Auditing **only if** `environment == 'prod'`
- Accepts:
  - `location`
  - `sqlAdminLogin` (secure)
  - `sqlAdminPassword` (secure)
  - `sqlServerName`, `sqlDatabaseName`
  - `sqlSkuName`
  - `environment`
- Outputs:
  - SQL Server Name
  - SQL FQDN

---

### `modules/vnet.bicep` — 🛡️ Network Isolation
- Deploys:
  - VNet per region
  - Two subnets (`frontend`, `backend`)
- Accepts:
  - `location`
  - `vnetAddressPrefix` (e.g. `10.10.0.0/16`)
  - `subnets` array: name + IP range
- Optional Output:
  - VNet Name
  - Subnet details

---

### `modules/cdn.bicep` — 🚀 Global Delivery (Optional)
- Deploys:
  - CDN Profile
  - Endpoint pointing to App Service origin
- Accepts:
  - `originHostName`
  - `httpsOnly` (bool)
- Outputs:
  - CDN Endpoint FQDN

---

## 🧪 Project Workflow Summary

### 🔹 Phase 1: Modular Infra Design
- Separate concerns into Bicep modules
- Use decorators like `@secure`, `@allowed`, and `@description`
- Add logic for environment-based toggles (e.g., auditing in prod)

### 🔹 Phase 2: Multi-Region Deployment
- Loop over regions with `for` to deploy apps, DBs, and VNets
- Generate dynamic names with `uniqueString()` + region
- Output URLs and FQDNs as a list

### 🔹 Phase 3: CDN Integration (Optional)
- Toggle CDN with `deployCdn` param
- Set origin to app FQDN
- Enforce HTTPS via `isHttpsAllowed`

---

## 🚀 How to Deploy

### 1. Prerequisites
- Azure CLI + Bicep CLI installed
- Logged into Azure (`az login`)
- Resource Group created:

```bash
az group create --name ToylandRG --location westus
```

---

### 2. Deploy the Infrastructure

#### 🔧 Development (no CDN, F1 SKU):

```bash
az deployment group create \
  --resource-group ToylandRG \
  --name dev-deploy \
  --template-file main.bicep \
  --parameters main.parameters.dev.json
```

#### 🔐 Production (CDN enabled, P1v2, auditing):

```bash
az deployment group create \
  --resource-group ToylandRG \
  --name prod-deploy \
  --template-file main.bicep \
  --parameters main.parameters.prod.json
```

---

## 📤 Outputs

After deployment, your `main.bicep` will output something like:

```json
[
  {
    "region": "westus",
    "appUrl": "https://myApp-westus.azurewebsites.net",
    "sqlFqdn": "toylandsql-westus.database.windows.net"
  },
  ...
]
```

---

## 📚 What I Learned

- How to write scalable, environment-aware infrastructure using Bicep
- Looping resources across regions with `for`
- Applying secure patterns (`@secure`, Key Vault)
- Using conditional deployments with `if()` and `environment`
- Structuring code for clarity and reusability — just like in a real-world cloud team

---

## 🔮 Future Improvements

- Add GitHub Actions CI/CD
- Use Bicep `what-if` to preview changes
- Add private endpoints to SQL in prod
- Switch from Azure CDN to Azure Front Door for smarter global routing
- Write a blog post documenting my design process

---

## 👋 License

Open source for learning and portfolio use. Build, fork, and remix it.

