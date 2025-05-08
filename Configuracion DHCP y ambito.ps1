#Configuracion DHCP
$nombreDC="coresajesu.local"
$nombreAmbito="coresajesu"
$ipDNS="192.168.99.1"
$ipGW= "192.168.99.1"
$ipAmbito= "192.168.99.0"
$ipInicial= "192.168.99.20"
$ipFinal= "192.168.99.40"
$mascara= "255.255.255.0"
#Instalar el rol de DHCP
install-windowsFeature -name DHCP
#Definir el ambito de DHCP
add-Dhcpserverv4Scope -name $nombreAmbito -StartRange $ipInicial -endrange $ipFinal -subnetMask $mascara
set-dhcpserverv4Optionvalue -ScopeID $ipAmbito -DNSserver $ipFinal -Dnsdomain $nombreAmbito -Router $ipGW
#Autorizacion
add-DhcpserverInDC -Dnsdomain $nombreDC