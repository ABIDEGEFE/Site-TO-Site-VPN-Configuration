# NSG rule to allow RDP/SSH from the firewall
az network nsg rule create \
  --resource-group HybridConnection \
  --nsg-name AzureNSG \
  --name AllowRDPFromFirewall \
  --direction Inbound \
  --access Allow \
  --protocol Tcp \
  --source-address-prefixes 10.2.3.4\
  --source-port-ranges '*' \
  --destination-address-prefixes 10.2.1.4\
  --destination-port-ranges 3389 \
  --priority 100
