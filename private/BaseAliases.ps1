function Set-TypeShellBaseAliases {
    [CmdletBinding()]
    [OutputType([void])]
    param()
    $baseAliasMappings = @{
        'print'          = 'Write-Output'
        'Print.Error'     = 'Write-Error'
        'Print.Warning'   = 'Write-Warning'
        'Print.Verbose'   = 'Write-Verbose'
        'Print.Debug'     = 'Write-Debug'
        'find'           = 'Get-ChildItem'
        'grep'           = 'Select-String'
        'filter'         = 'Where-Object'
        'iterate'        = 'ForEach-Object'
        'unique'         = 'Get-Unique'
        'size'           = 'Measure-Object'
        'request.head'   = 'Invoke-WebRequest -Method HEAD'
        'request.get'    = 'Invoke-WebRequest -Method GET'
        'request.options'  = 'Invoke-WebRequest -Method OPTIONS'
        'request.post'   = 'Invoke-WebRequest -Method POST'
        'request.put'    = 'Invoke-WebRequest -Method PUT'
        'request.delete' = 'Invoke-WebRequest -Method DELETE'
        'restRequest.post'   = 'Invoke-RestMethod -Method POST'
        'restRequest.put'    = 'Invoke-RestMethod -Method PUT'
        'restRequest.delete' = 'Invoke-RestMethod -Method DELETE'
        'restRequest.get'    = 'Invoke-RestMethod -Method GET'
        'restRequest.head'   = 'Invoke-RestMethod -Method HEAD'
        'procs'          = 'Get-Process'
        'svcs'           = 'Get-Service'
        'datetime.date'     = 'Get-Date'
        'datetime.now'      = '(Get-Date -Format "yyyy-MM-dd HH:mm:ss")'
        'datetime.ymd'     = '(Get-Date -Format "yyyy-MM-dd")'
        'datetime.ymdHms'  = '(Get-Date -Format "yyyy-MM-dd HH:mm:ss")'
        'datetime.ymdHmsf' = '(Get-Date -Format "yyyy-MM-dd HH:mm:ss.fff")'
    }
    foreach ($mapping in $baseAliasMappings.GetEnumerator()) {
        Set-Alias -Name $mapping.Key -Value $mapping.Value -Scope Global
    }
}