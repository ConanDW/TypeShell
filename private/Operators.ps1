function Set-TypeShellOperators {
    [CmdletBinding()]
    [OutputType([void])]
    param($key, $arg)

    $script:wEqualsMappings = @{
        '=' = '-eq'
        '!' = '-ne'
        '<' = '-le'
        '>' = '-ge'
    }
    $script:woEqualsMappings = @{
        '<' = '-lt '
        '>' = '-gt '
    }
    Set-PSReadLineKeyHandler -Chord '=' -BriefDescription "Comparison Operators w/ =" -ScriptBlock {
        param($key, $arg)
        $line = $null
        $cursor = $null
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        $prevChar = $line[$cursor - 1]
        if ($script:wEqualsMappings.ContainsKey($prevChar)) {
            [Microsoft.PowerShell.PSConsoleReadLine]::Delete($cursor - 1, 1)
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert($script:wEqualsMappings[$prevChar])
        } 
        else {
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert("=")
        }
    }
    Set-PSReadLineKeyHandler -Chord 'Spacebar' -BriefDescription "Comparison Operators w/o =" -ScriptBlock {
        #spacebar needs to be pressed twice to trigger the key handler, this makes it seperate from =.
        param($key, $arg)
        $line = $null
        $cursor = $null
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        $prevChar = $line[$cursor - 1]
        if ($script:woEqualsMappings.ContainsKey($prevChar)) { 
            [Microsoft.PowerShell.PSConsoleReadLine]::Delete($cursor - 1, 1)
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert($script:woEqualsMappings[$prevChar])
        }
        else { 
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert(' ')
        }
    }
    Set-PSReadLineKeyHandler -Chord '&&' -BriefDescription "Logical AND" -ScriptBlock {
        param($key, $arg)
        $line = $null
        $cursor = $null
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        if ($line[$cursor - 1] -eq '&') { 
            [Microsoft.PowerShell.PSConsoleReadLine]::Delete($cursor - 1, 1)
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert('-and ')
        }
        else { 
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert('&&')
        }
    }
    Set-PSReadLineKeyHandler -Chord '||' -BriefDescription "Logical OR" -ScriptBlock {
        param($key, $arg)
        $line = $null
        $cursor = $null
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        if ($line[$cursor - 1] -eq '|') { 
            [Microsoft.PowerShell.PSConsoleReadLine]::Delete($cursor - 1, 1)
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert('-or ')
        }
        else { 
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert('||')
        }
    }
}
