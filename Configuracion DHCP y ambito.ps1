#Configuracion DHCP
$nombreDC="nombretuyo.local"
$nombreAmbito="Nombretuyo"
$ipDNS="192.168.x.x"
$ipGW= "192.168.x.x"
$ipAmbito= "192.168.x.x"
$ipInicial= "192.168.x.x"
$ipFinal= "192.168.x.x"
$mascara= "255.255.255.255" # Cuidado con la mascara / Caution to net Mask
#Instalar el rol de DHCP
install-windowsFeature -name DHCP
#Definir el ambito de DHCP
add-Dhcpserverv4Scope -name $nombreAmbito -StartRange $ipInicial -endrange $ipFinal -subnetMask $mascara
set-dhcpserverv4Optionvalue -ScopeID $ipAmbito -DNSserver $ipFinal -Dnsdomain $nombreAmbito -Router $ipGW
#Autorizacion

add-DhcpserverInDC -Dnsdomain $nombreDC
