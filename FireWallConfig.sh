# step1. create public IP

az network public-ip create --resource-group HybridConnection --name AzureFirewallPublicIP --sku Standard --location eastus

# step2. create firewall subnet

az network vnet subnet create --resource-group HybridConnection --vnet-name AzureVnet --name AzureFirewallSubnet --address-prefixes 10.2.3.0/26

# step3. create firewall

az network firewall create --name AzureFirewall --resource-group "HybridConnection" --location eastus

# step4. attach public ip to azure firewall

az network firewall ip-config create --firewall-name AzureFirewall --name AzureFirewallIPConfig --public-ip-address AzureFirewallPublicIP --vnet-name AzureVnet --resource-group HybridConnection
