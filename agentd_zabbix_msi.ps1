####instalação do zabbix agent GPO####
#
#AUTOR: PABLO OLIVEIRA
#
$InstallLocation = "\\SEU SERVIDOR\NETLOGON"
#
#aqui voce coloca o nome do agente baixado:
$MSIFile = "NOME DO ARQUIVO .MSI"
#
# Exemplo: MSIFile = "zabbix_agent2-7.0.3-windows-amd64-openssl.msi"
#
$EXE = "msiexec.exe"
#
#aqui voce muda do seu IP do Server:
$Zabbixserver = "SEU IP DO SERVER"
#
$HostFQDN = ([System.Net.Dns]::GetHostByName(($env:COMPUTERNAME))).HostName
#
$Arguments = "/i `"$InstallLocation\$MSIFile`" HOSTNAME=$HostFQDN SERVER=$Zabbixserver SERVERACTIVE=$Zabbixserver ENABLEPATH=TRUE LOGFILE=`"$InstallLocation\zabbix_agentd.log`" LISTENPORT=10050 Timeout=30  ALLOWDENYKEY=AllowKey=system.run[*] /qn"
#
#$InstallDestination = ($env:ProgramFiles) + "\Zabbix Agent 3"
# 
Start-Process -FilePath $EXE -ArgumentList $Arguments -Wait
#
####Fim do Script####
