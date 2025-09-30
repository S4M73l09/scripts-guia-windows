#Configuracion DHCP / Configure DHCP
$nombreDC="nombretuyo.local"
$nombreAmbito="Nombretuyo"
$ipDNS="192.168.x.x"
$ipGW= "192.168.x.x"
$ipAmbito= "192.168.x.x"
$ipInicial= "192.168.x.x"
$ipFinal= "192.168.x.x"
$mascara= "255.255.255.255" # Cuidado con la mascara / be careful with the net mask
#Instalar el rol de DHCP / Install DHCP Role
install-windowsFeature -name DHCP
#Definir el ambito de DHCP / Define scope of DHCP
add-Dhcpserverv4Scope -name $nombreAmbito -StartRange $ipInicial -endrange $ipFinal -subnetMask $mascara
set-dhcpserverv4Optionvalue -ScopeID $ipAmbito -DNSserver $ipFinal -Dnsdomain $nombreAmbito -Router $ipGW
#Autorizacion / Authorization

add-DhcpserverInDC -Dnsdomain $nombreDC

