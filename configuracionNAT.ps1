#Configuración de NAT
#Instalamos la característica 
Install-WindowsFeature Routing -IncludeManagementTools
#Configuramos NAT para que la red interna tenga acceso al exterior
New-NetNat -Name "IntNetCore" -InternalIPInterfaceAddressPrefix "192.168.99.0/24"