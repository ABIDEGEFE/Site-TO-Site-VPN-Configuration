PIPVNGONPREMISE=$(az network public-ip show --resource-group "HybridConnection" --name PIP-VNG-On-Premise --query "[ipAddress]" --output tsv)


az network local-gateway create --resource-group "HybridConnection" --gateway-ip-address $PIPVNGONPREMISE --name LNG-ON-PREMISE --local-address-prefixes 10.1.0.0/16 
