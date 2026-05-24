function Enable-TypeShell {
    [CmdletBinding()]
    [OutputType([void])]
    param()
    Begin {
        $ErrorActionPreference = 'Stop'
        Write-Verbose "Enabling TypeShell...."
        Set-StrictMode -Version Latest
    }
    Process {
        try {
            Write-Verbose "---Enabling TypeShell Operators---- `n"
            Set-TypeShellOperators
            Write-Verbose "----Operators Enabled---- `n"
            Write-Verbose "----Enabling TypeShell Types---- `n"
            Set-TypeShellTypes
            Write-Verbose "----Types Enabled---- `n"
            Write-Verbose "----Enabling TypeShell Cmdlet Replacements---- `n"
            Set-TypeShellBaseAliases
            Write-Verbose "----Cmdlet Replacements Enabled---- `n"
        }
        catch {
            $errDiag = "Error: $($_.Exception) `n $($_.ScriptStackTrace)"
            throw "Failed to enable TypeShell: $errDiag"
        }
    }
    End {
        Write-Verbose "TypeShell Enabled"
    }
}