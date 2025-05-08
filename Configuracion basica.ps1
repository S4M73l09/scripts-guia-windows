#Crearemos la configuracion basica del ordenador.
#Nombrar el equipo
$pc="dcsajesu"

#Configurar Direcciones IP
$diripexterna = "10.0.3.45"
$diripinterna = "192.168.99.1"
#nombre adaptadores de red
$redint = "Ethernet 2"
$redext= "Ethernet"
$gateway= "10.0.3.1"
$DNS= "8.8.8.8,8.8.4.4"
Rename-computer -NewName $pc
Get-NetAdapter -Name $redint | Remove-NetIPAddress -confirm:$false
Get-NetAdapter -Name $redext | Remove-NetIPAddress -confirm:$false
Get-NetAdapter -Name $redint | New-NetIPAddress -AddressFamily IPv4 -IPAddress $diripinterna -PrefixLength 24 -Type Unicast
Get-NetAdapter -Name $redext | New-NetIPAddress -AddressFamily IPv4 -IPAddress $diripexterna -PrefixLength 24 -Type Unicast -DefaultGateway $gateway | Set-DnsClientServerAddress -ServerAddresses $DNS

Rename-NetAdapter -Name $redint -NewName "INTERNO"
Rename-NetAdapter -Name $redext -NewName "EXTERNO"
Restart-Computer -Force