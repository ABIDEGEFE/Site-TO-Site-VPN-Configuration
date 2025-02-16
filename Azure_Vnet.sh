az network vnet create \
  --resource-group HybridConnection \
  --name AzureVNet \
  --address-prefixes 10.2.0.0/16 \
  --subnet-name Apps \
  --subnet-prefixes 10.2.1.0/24
