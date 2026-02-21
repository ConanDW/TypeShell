$privateFunctions = Get-ChildItem -Path $PSScriptRoot/private -Filter *.ps1
$publicFunctions = Get-ChildItem -Path $PSScriptRoot/public -Filter *.ps1

foreach ($function in $privateFunctions) {
    . $function.FullName
}

foreach ($function in $publicFunctions) {
    . $function.FullName
}

