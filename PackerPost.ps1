#Powershell Script for Packer Image
#Jerry Reid
#Version 0.1
#January 23rd 2018

#Setup winrm allows packer to install vmware tools

write-output "Setting up WinRM"
write-host "(host) setting up WinRM"

winrm quickconfig -q
winrm quickconfig -transport:http
winrm s winrm/config '@{MaxTimeoutms="1800000"}'
winrm s winrm/config/winrs '@{MaxMemoryPerShellMB="512"}'
winrm s winrm/config/service '@{AllowUnencrypted="true"}'
winrm s winrm/config/client '@{AllowUnencrypted="true"}'
winrm s winrm/config/service/auth '@{Basic="true"}'
winrm s winrm/config/client/auth '@{Basic="true"}'
winrm s winrm/config/service/auth '@{CredSSP="true"}'
winrm s winrm/config/listener?Address=*+Transport=HTTP '@{Port="5985"}'
netsh advfirewall firewall set rule group="remote administration" new enable=yes
netsh advfirewall firewall add rule name="WinRM-5985" dir=in action=allow protocol=TCP localport=5985


#DNS Info for Particular Site



#VeloCloud Install




#Start the OOBE Process
#Start-Process -FilePath C:\Windows\System32\Sysprep\Sysprep.exe -ArgumentList '/generalize /oobe /quiet'

