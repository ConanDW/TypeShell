function Set-TypeShellTypes {
    [CmdletBinding()]
    [OutputType([void])]
    param($key, $arg)
    $mappings = @{
        "string (\w+) = (\w+)"     = '[string]$$$1 = $2'
        "int (\w+) = (\d+)"        = '[int]$$$1 = $2'
        "bool (\w+) = (\w+)"       = '[bool]$$$1 = $2'
        "float (\w+) = (\d+)"      = '[float]$$$1 = $2'
        "double (\w+) = (\d+)"     = '[double]$$$1 = $2'
        "const (\w+) (\w+) = (.+)" = 'New-Variable -Name $2 -Value ([$1]$3) -Option Constant'

    }
    Set-PSReadLineKeyHandler -Chord 'Enter' -BriefDescription 'Strict Types' -ScriptBlock {
        param($key, $arg)
        $line = $null
        $cursor = $null
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        foreach ($l in $mappings.GetEnumerator()) {
            if ($line -match $l.Key) {
                $pushPSNative = $line -replace $l.Key, $l.Value
                [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
                [Microsoft.PowerShell.PSConsoleReadLine]::Insert($pushPSNative + " ")
                [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
                return
            }
        }
        [Microsoft.PowerShell.PSConsoleReadLine]::AcceptLine()
        return
    }.GetNewClosure()
    
}