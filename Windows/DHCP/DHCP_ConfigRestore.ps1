$DHCPServer = Read-Host "Enter Server to restore configuration on:

Restore-DhcpServer -ComputerName "$DHCPServer"
