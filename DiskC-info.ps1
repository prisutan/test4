#skripta koja proverava prostor na lokalnim diskovima
param ( $computername="localhost"
)
Get-WmiObject -class Win32_LogicalDisk -computername $computername `
-filter "drivetype=3" |
Sort-Object -property DeviceID |
Format-Table -property DeviceID, 
@{label='FreeSpace(GB)';expression={$_.FreeSpace / 1GB -as [int]}}, 
@{label='Size(GB)';expression={$_.Size / 1GB -as [int]}}, 
@{label='%Free';expression={$_.FreeSpace / $_.Size * 100 -as [int]}}