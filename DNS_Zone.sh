# Create Private DNS Zone
az network private-dns zone create \
  --resource-group HybridConnection \
  --name contoso.internal \
  --location eastus

# Link DNS Zone to OnPremVNet
az network private-dns link vnet create \
  --resource-group HybridConnection \
  --zone-name contoso.internal \
  --name OnPremLink \
  --virtual-network OnPremVNet \
  --registration-enabled True

# Link DNS Zone to AzureVNet
az network private-dns link vnet create \
  --resource-group HybridConnection \
  --zone-name contoso.internal \
  --name AzureLink \
  --virtual-network AzureVNet \
  --registration-enabled true

# Add A Record for Azure VM
az network private-dns record-set a add-record \
  --resource-group HybridConnection \
  --zone-name contoso.internal \
  --record-set-name azure-vm \
  --ipv4-address 10.2.1.4

# Add A Record for OnPrem VM
az network private-dns record-set a add-record \
  --resource-group HybridConnection \
  --zone-name contoso.internal \
  --record-set-name onprem-vm \
  --ipv4-address 10.1.1.4
