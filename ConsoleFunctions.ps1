# Funktion für das Powershell Profil -> kopiert den zuletzt ausgeführten Befehl in die Zwischenablage

#region function Copy-CommandLine
function Copy-CommandLine([int]$CommandHistoryNumber = 0){
       if ($CommandHistoryNumber -eq 0)
       {
             Write-Host "The command history index has not been specified" -ForegroundColor DarkYellow
             Write-Host "Assuming the last command shall be copied into clipboard" -ForegroundColor DarkYellow
             $CommandHistoryNumber = (Get-History | Select-Object -Last 1).Id
       }
       
       $cmd = Get-History -Id $CommandHistoryNumber -ErrorAction SilentlyContinue
       if ($null -ne $cmd)
       {
             $cmd.CommandLine | clip
             Write-Host "Copied the following command line to clip board:" -ForegroundColor Green
             Write-Host " " $cmd.CommandLine -ForegroundColor Green
       }
}
Set-Alias -Name ccl -Value Copy-CommandLine
#endregion
