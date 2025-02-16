az network vpn-connection create --resource-group "HybridConnection" --name ON-PREMISE-To-Azure-VNet-1 --vnet-gateway1 VNG-On-Premise --shared-key $SHAREDKEY --local-gateway2 LNG-Azure-VNet-1
