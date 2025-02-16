PIPVNGAZUREVNET1=$(az network public-ip show \
    --resource-group "HybridConnection" \
    --name PIP-VNG-Azure-VNet-1 \
    --query "[ipAddress]" \
    --output tsv)


az network local-gateway create --resource-group "HybridConnection" --gateway-ip-address $PIPVNGAZUREVNET1 --name LNG-Azure-VNet-1 --local-address-prefixes 10.2.0.0/16
