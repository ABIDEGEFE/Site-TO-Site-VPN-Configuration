# step1. create route table

az network route-table create --name AzureFirewallRouteTable --resource-group HybridConnection --location eastus

# step2. add route to force traffic to azure firewall

az network route-table route create --name RouteToFirewall --resource-group HybridConnection --route-table-name AzureFirewallRouteTable --address-prefix 0.0.0.0/0 --next-hop-type VirtualAppliance --next-hop-ip-address 10.2.3.4

# step3. associate route table to Apps subnet

az network vnet subnet update --resource-group HybridConnection --vnet-name AzureVnet --name Apps --route-table AzureFirewallRouteTable

# step4. create firewall rule

# Allow www.microsoft.com
az network firewall application-rule create \
  --resource-group HybridConnection \
  --firewall-name AzureFirewall \
  --collection-name AllowMicrosoft \
  --name AllowMicrosoftDomain \
  --source-addresses 10.2.1.0/24 \
  --protocols Http=80 Https=443 \
  --target-fqdns "www.microsoft.com" \
  --action Allow \
  --priority 100

# Allow ICMP between OnPremVNet and AzureVNet
az network firewall network-rule create \
  --resource-group HybridConnection \
  --firewall-name AzureFirewall \
  --collection-name AllowPing \
  --name AllowPingRule \
  --source-addresses 10.1.0.0/16 10.2.0.0/16 \
  --protocols ICMP \
  --destination-addresses 10.1.0.0/16 10.2.0.0/16 \
  --destination-ports '*' \
  --action Allow \
  --priority 200

# DNAT rule for RDP/SSH
az network firewall nat-rule create \
  --resource-group HybridConnection \
  --firewall-name AzureFirewall \
  --collection-name AllowRDP \
  --name AllowRDPRule \
  --source-addresses '*' \
  --destination-addresses 172.191.210.161 \
  --destination-ports 3389 \
  --translated-address 10.2.1.4 \
  --translated-port 3389 \
  --protocols TCP \
  --action Dnat \
  --priority 300
