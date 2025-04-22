param locations array = [
  'westus'
  'eastus2'
  'westus2'
]

@secure()
param sqlAdminLogin string

@secure()
param sqlAdminPassword string

@allowed([
  'dev'
  'prod'
])
param environment string = 'dev'

@allowed([
  'F1'
  'P1v2'
])
param appServicePlanSku string = 'F1'

param sqlSkuName string = 'S0'

// Deploy App Services
module appModule 'modules/app.bicep' = [for (location, i) in locations: {
  name: 'app-${location}'
  params: {
    location: location
    appName: 'app-${location}-${uniqueString(resourceGroup().id)}'
    appServicePlanSku: appServicePlanSku
    appServicePlanName: 'appPlan-${location}-${uniqueString(resourceGroup().id)}'
  }
}]

// Deploy Databases
module databaseModule 'modules/database.bicep' = [for (location, i) in locations: {
  name: 'db-${location}'
  params: {
    location: location
    sqlAdminLogin: sqlAdminLogin
    sqlAdminPassword: sqlAdminPassword
    sqlServerName: 'sql-${location}-${uniqueString(resourceGroup().id)}'
    sqlDatabaseName: 'db-${location}-${uniqueString(resourceGroup().id)}'
    sqlSkuName: sqlSkuName
    environment: environment
  }
}]

// Deploy VNets
module vnetModule 'modules/vnet.bicep' = [for (location, i) in locations: {
  name: 'vnet-${location}'
  params: {
    location: location
    index: i
  }
}]

// Outputs
output appSummary array = [for (location, i) in locations: {
  region: location
  url: appModule[i].outputs.appServiceUrl
}]

output sqlSummary array = [for (location, i) in locations: {
  region: location
  fqdn: databaseModule[i].outputs.sqlDbFqdn
}]

output vnetSummary array = [for (location, i) in locations: {
  region: location
  name: vnetModule[i].outputs.virtualNetworkInfo.name
  addressPrefix: vnetModule[i].outputs.virtualNetworkInfo.addressPrefix
  subnets: vnetModule[i].outputs.virtualNetworkInfo.subnets
}]




