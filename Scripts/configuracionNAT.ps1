#Configuración de NAT / Configuration Nat
#Instalamos la característica / Install the feature 
Install-WindowsFeature Routing -IncludeManagementTools
#Configuramos NAT para que la red interna tenga acceso al exterior / we configure NAT so that the internal Network has access outside

New-NetNat -Name "IntNetCore" -InternalIPInterfaceAddressPrefix "192.168.99.0/24"
