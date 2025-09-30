#Crea un dominio en windows core / Create Domain in windows Core 
$dominioFQDN = "tunombre.local"
$dominioNETBIOS = "tunombre"
$passDominio = "p@ssword.22"
Install-WindowsFeature AD-Domain-Services,DNS
Import-module ADDSDeployment

Install-ADDSForest -DomainName $dominioFQDN -DomainNetBiosName $dominioNETBIOS -SafeModeAdministratorPassword (ConvertTo-SecureString -string $passDominio -AsPlainText -Force) -DomainMode WinThreshold -ForestMode WinThreshold -InstallDNS -Confirm:$false
