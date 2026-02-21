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
    }
    foreach ($mapping in $baseAliasMappings.GetEnumerator()) {
        Set-Alias -Name $mapping.Key -Value $mapping.Value -Scope Global
    }
}