az network vnet subnet create \
    --resource-group HybridConnection\
    --address-prefixes 10.1.2.0/24 \
    --name GatewaySubnet \
    --vnet-name OnPremVNet
