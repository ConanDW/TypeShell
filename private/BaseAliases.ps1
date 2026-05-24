function Set-TypeShellBaseAliases {
    [CmdletBinding()]
    [OutputType([void])]
    param()
    $baseAliasMappings = @{
        'Print'          = 'Write-Output'
        'PrintError'     = 'Write-Error'
        'PrintWarning'   = 'Write-Warning'
        'PrintVerbose'   = 'Write-Verbose'
        'PrintDebug'     = 'Write-Debug'
        'Find'           = 'Get-ChildItem'
        'Grep'           = 'Select-String'
        'Filter'         = 'Where-Object'
        'Iterate'        = 'ForEach-Object'
        'Unique'         = 'Get-Unique'
        'Size'           = 'Measure-Object'
        'Fetch'          = 'Invoke-WebRequest -Method GET'
        'Request.post'   = 'Invoke-RestMethod -Method POST'
        'Request.put'    = 'Invoke-RestMethod -Method PUT'
        'Request.delete' = 'Invoke-RestMethod -Method DELETE'
        'Request.get'    = 'Invoke-RestMethod -Method GET'
        'Request.head'   = 'Invoke-RestMethod -Method HEAD'
        'Procs'          = 'Get-Process'
        'Services'       = 'Get-Service'
        'GetTime'        = 'Measure-Command'
        'Clip'           = 'Set-Clipboard'
        'Paste'          = 'Get-Clipboard'

    }
    foreach ($mapping in $baseAliasMappings.GetEnumerator()) {
        Set-Alias -Name $mapping.Key -Value $mapping.Value -Scope Global
    }
}