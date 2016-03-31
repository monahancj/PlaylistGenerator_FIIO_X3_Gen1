
$SongList = Import-Csv -Path Songlist_X3_edited.csv
$SongList | select -First 1
$PlaylistsToMake = "Reggae"
foreach ($PlaylistName in $PlaylistsToMake) {
    Out-File -InputObject "#EXTM3U" -FilePath "$($env:TEMP)\g_$($PlaylistName).m3u8"
    $SongList | Where-Object { $_.Genre -eq $PlaylistName } | Select-Object -ExpandProperty PathDest | Out-File -FilePath "$($env:TEMP)\g_$($PlaylistName).m3u8" -Append
    gc "$($env:TEMP)\g_$($PlaylistName).m3u8"
    Move-Item -Path "$($env:TEMP)\g_$($PlaylistName).m3u8" -Destination F:\
}
