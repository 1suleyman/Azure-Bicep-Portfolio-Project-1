// Deploy an Azure SQL logical server + DB

// this module deploys an Azure SQL logical server and a database

// this is one is a bit harder to think of than the app service one from scratch so I have to think about it a bit more
// questions 
// what does a azure sql server look like?
// what does a azure sql database look like?
// do i need to link the location of the sql server to the location of the sql database?
// do i need to link the location to the location of the resource group?
// how can i make it so the location of the sql server and the sql database are the same as the resource group even if the resource group changes do to conditions for example if in prod then do it in westus?
@description('The location for the SQL resources.')
param location string = resourceGroup().location // default to the resource group location

@secure()
@description('The SQL admin login name.')
param sqlAdminLogin string 

@secure()
@description('The SQL admin login password.')
param sqlAdminPassword string

@description('The name of the SQL server.')
param sqlServerName string = 'toylandsql-${uniqueString(resourceGroup().id)}'

@description('The name of the SQL database.')
param sqlDatabaseName string = 'ToylandDB-${uniqueString(resourceGroup().id)}'

@description('The SKU name for the SQL database (e.g., S0, Basic, Standard).')
param sqlSkuName string = 'Standard'

@allowed([
  'dev'
  'prod'
])
@description('The environment to deploy to.')
param environment string = 'dev'

var auditingEnabled = environment == 'prod'


// SQL Server
resource sqlServer 'Microsoft.Sql/servers@2021-11-01' = {
  name: sqlServerName
  location: location
  properties: {
    administratorLogin: sqlAdminLogin
    administratorLoginPassword: sqlAdminPassword
  }
}

// SQL Database
resource sqlDatabase 'Microsoft.Sql/servers/databases@2021-11-01' = {
  name: sqlDatabaseName
  parent: sqlServer
  location: location
  sku: {
    name: sqlSkuName
  }
}

// Only in production: create storage account for auditing
resource auditStorageAccount 'Microsoft.Storage/storageAccounts@2021-09-01' = if (auditingEnabled) {
  name: 'audit${uniqueString(resourceGroup().id)}'
  location: location
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
}

// Enable auditing if prod
resource auditingSettings 'Microsoft.Sql/servers/auditingSettings@2021-11-01' = if (auditingEnabled) {
  name: 'default'
  parent: sqlServer
  properties: {
    state: 'Enabled'
    storageEndpoint: auditingEnabled ? auditStorageAccount.properties.primaryEndpoints.blob : '' // If auditingEnabled is true, use the real value — otherwise, just pass an empty string.
    storageAccountAccessKey: auditingEnabled ? auditStorageAccount.listKeys().keys[0].value : '' // If auditingEnabled is true, use the real value — otherwise, just pass an empty string.
  }
}

// Outputs
output sqlServerName string = sqlServer.name
output sqlDbFqdn string = sqlServer.properties.fullyQualifiedDomainName











