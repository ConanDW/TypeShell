function Set-TypeShellBaseAliases {
    [CmdletBinding()]
    [OutputType([void])]
    param()
    $baseAliasMappings = @{
        'Print'        = 'Write-Output'
        'PrintError'   = 'Write-Error'
        'PrintWarning' = 'Write-Warning'
        'PrintVerbose' = 'Write-Verbose'
        'PrintDebug'   = 'Write-Debug'
        'Find'         = 'Get-ChildItem'
        'Grep'         = 'Select-String'
        'Filter'       = 'Where-Object'
        'Iterate'      = 'ForEach-Object'
        'Unique'       = 'Get-Unique'
        'Size'         = 'Measure-Object'
        'Fetch'        = 'Invoke-RestMethod'
        'Request'      = 'Invoke-WebRequest'
        'Procs'        = 'Get-Process'
        'Services'     = 'Get-Service'
        'GetTime'      = 'Measure-Command'
        'Clip'         = 'Set-Clipboard'
        'Paste'        = 'Get-Clipboard'
    }
    foreach ($mapping in $baseAliasMappings.GetEnumerator()) {
        Set-Alias -Name $mapping.Key -Value $mapping.Value -Scope Global
    }
}