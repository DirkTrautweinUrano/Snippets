# Prüfen ob ein Ordner existiert und anlegen falls dieser nicht existiert.
$targetPath = "Pfad der geprüft und ggf. angelegt werden soll."
if (-not (Test-Path $targetPath -PathType Container)){ $null = mkdir $targetPath }



# Die aus Linux bekannte Touch Funktion
function Set-FileDate {
    [CmdletBinding()]
    param(
        [Parameter(ValueFromPipeline = $true, Mandatory = $true, Position = 0)]
        [string[]]$Path,
        [Parameter(Mandatory = $false, Position = 1)]
        [datetime]$NewDate = (Get-Date),
        [switch]$Force
    )
    Get-Item $Path -Force:$Force | ForEach-Object { $_.LastWriteTime = $NewDate }
}
Set-Alias Touch Set-FileDate -Description "Updates the LastWriteTime for the file(s)"