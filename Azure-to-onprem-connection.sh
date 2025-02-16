SHAREDKEY="12345678" #change while implementation

az network vpn-connection create --resource-group HybridConnection --name Azure-VNet-1-To-ON-PREMISE --vnet-gateway1 VNG-Azure-VNet --shared-key $SHAREDKEY --local-gateway2 LNG-ON-PREMISE
