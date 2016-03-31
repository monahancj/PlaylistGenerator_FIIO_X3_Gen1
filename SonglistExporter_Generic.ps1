﻿$FileList = Get-ChildItem -Path "F:\" -Include *.mp3,*.flac,*.m4a -Recurse | Select-Object -ExpandProperty FullName
$SongList = $FileList | Select-Object @{n='PlayList';e={""}},@{n='Genre';e={""}},@{n='Artist';e={($_ -split("\\"))[-3]}},@{n='Album';e={($_ -split("\\"))[-2]}},@{n='PathDest';e={$_ -replace "F:\\","TF2:\"}},@{n='PathSource';e={$_}}
$SongList | Export-Csv -Path Songlist_X3.csv -NoTypeInformation