az network vnet create \
  --resource-group HybridConnection \
  --name OnPremVNet \
  --address-prefixes 10.1.0.0/16 \
  --subnet-name OnPremApps \
  --subnet-prefixes 10.1.1.0/24
