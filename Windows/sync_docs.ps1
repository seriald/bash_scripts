If (!(Test-Path v:))
{
$map = new-object -ComObject WScript.Network
$map.MapNetworkDrive("V:","\\nas03\docs1", $true)
#$map.MapNetworkDrive("V:","\\nas03\test", $true)
}

If (!(Test-Path U:))
{
$map = new-object -ComObject WScript.Network
$map.MapNetworkDrive("U:","\\nas01\docs", $true)
}

If (!(Test-Path h:))
{
$map = new-object -ComObject WScript.Network
$map.MapNetworkDrive("h:","\\nas01\docs\robert", $true)
}

#robocopy "C:\Users\adm.robert\Dropbox\Camera Uploads" "h:\docs\Photos\Mobile Photos" /FFT /Z /W:5 /e /xx
#robocopy "C:\Users\adm.robert\Dropbox\Camera Uploads" "h:\docs\Photos\Mobile Photos" /mt /FFT /Z /W:5 /e /xx /copy:dt /dcopy:t
robocopy "C:\Users\adm.robert\Dropbox\Camera Uploads" "h:\docs\Photos\Mobile Photos" /mt /FFT /Z /W:5 /e /xx /XF "*\.DS_Store*" /n:5
#robocopy u: v: /FFT /Z /W:5 /e /xx

robocopy u: v: /mir /FFT /Z /W:5 /e /xx      
  