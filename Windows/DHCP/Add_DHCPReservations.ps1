#v1.0 
#Created by Robert Fleming
# 2021/02/01
#Source: 

$current = pwd
$DHCPReservations = "$current\csv\DHCP_Reservations.csv"

Write-Host "Reading from $DHCPReservations"
Import-CSV "$DHCPReservations" | Add-DhcpServerv4Reservation