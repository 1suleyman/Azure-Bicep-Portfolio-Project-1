//appbicep
// Create a reusable Bicep App Service module (app.bicep)
@description ('The name of the resource group to deploy the app to.')
param location string = resourceGroup().location

@description ('The name of the app service plan.')
param appServicePlanName string = 'myAppServicePlan'

@description('The name of the app service.')
param appName string

// Allow different SKUs (F1 for dev, P1v2 for prod)
@allowed([
  'F1'
  'P1v2'
])
@description('The name of the app service plan SKU.')
param appServicePlanSku string

@description('next is create a new app service plan resource')
resource appServicePlan 'Microsoft.Web/serverfarms@2022-03-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSku 
  }
}

@description('Create a new app service resource')
resource appService 'Microsoft.Web/sites@2022-03-01' = {
  name: appName
  location: location
  kind: 'app'
  properties: {
    serverFarmId: appServicePlan.id // Link to the app service plan
  }
}
@description('The public hostname of the app service.')
output appServiceUrl string = 'https://${appService.properties.defaultHostName}'
// i added https to the output so i dont have to add it when im testing it later!


