param location string
param index int

@description('The IP address range for the virtual network.')
var vnetAddressPrefix = '10.${index}.0.0/16'

@description('The subnets for the virtual network.')
var subnets = [
  {
    name: 'frontend'
    addressPrefix: '10.${index}.1.0/24'
  }
  {
    name: 'backend'
    addressPrefix: '10.${index}.2.0/24'
  }
]

var subnetProperties = [for subnet in subnets: {
  name: subnet.name
  properties: {
    addressPrefix: subnet.addressPrefix
  }
}]

resource vnet 'Microsoft.Network/virtualNetworks@2021-05-01' = {
  name: 'vnet-${location}'
  location: location
  properties: {
    addressSpace: {
      addressPrefixes: [vnetAddressPrefix]
    }
    subnets: subnetProperties
  }
}

output virtualNetworkInfo object = {
  name: vnet.name
  addressPrefix: vnetAddressPrefix
  subnets: subnets
}


