#Crearemos la configuracion basica del ordenador / We create the basic configure of PC
#Nombrar el equipo / Name the PC
$pc="Nombretuyo"

#Configurar Direcciones IP / Configure IP
$diripexterna = "x.x.x.x"
$diripinterna = "x.x.x.x"
#nombre adaptadores de red / Name of red adapters
$redint = "Ethernet 2"
$redext= "Ethernet"
$gateway= "x.x.x.x"
$DNS= "8.8.8.8,8.8.4.4"
Rename-computer -NewName $pc
Get-NetAdapter -Name $redint | Remove-NetIPAddress -confirm:$false
Get-NetAdapter -Name $redext | Remove-NetIPAddress -confirm:$false
Get-NetAdapter -Name $redint | New-NetIPAddress -AddressFamily IPv4 -IPAddress $diripinterna -PrefixLength 24 -Type Unicast
Get-NetAdapter -Name $redext | New-NetIPAddress -AddressFamily IPv4 -IPAddress $diripexterna -PrefixLength 24 -Type Unicast -DefaultGateway $gateway | Set-DnsClientServerAddress -ServerAddresses $DNS

Rename-NetAdapter -Name $redint -NewName "INTERNO"
Rename-NetAdapter -Name $redext -NewName "EXTERNO"

Restart-Computer -Force

