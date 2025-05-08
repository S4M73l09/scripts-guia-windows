#Crea un dominio en windows core
$dominioFQDN = "coresajesu.local"
$dominioNETBIOS = "coresajesu"
$passDominio = "p@ssw0rd.22"
Install-WindowsFeature AD-Domain-Services,DNS
Import-module ADDSDeployment
Install-ADDSForest -DomainName $dominioFQDN -DomainNetBiosName $dominioNETBIOS -SafeModeAdministratorPassword (ConvertTo-SecureString -string $passDominio -AsPlainText -Force) -DomainMode WinThreshold -ForestMode WinThreshold -InstallDNS -Confirm:$false