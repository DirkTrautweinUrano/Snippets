$targetPath = "Pfad der geprüft und ggf. angelegt werden soll."
if (-not (Test-Path $targetPath -PathType Container)){ $null = mkdir $targetPath }
