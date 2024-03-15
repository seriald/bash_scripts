$DHCPServer = Read-Host "Please enter DHCP Server:"

Export-DhcpServer -ComputerName "$DHCPServer" -File "C:\temp\dhcpexport.xml"
# Backup-DhcpServer -ComputerName "$DHCPServer"
