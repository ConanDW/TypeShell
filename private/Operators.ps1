function Set-TypeShellOperators {
    [CmdletBinding()]
    [OutputType([void])]
    param($key, $arg)
    Set-PSReadLineKeyHandler -Chord '=' -BriefDescription "Comparison Operators w/ =" -ScriptBlock {
        param($key, $arg)
        $line = $null
        $cursor = $null
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        switch ($line[$cursor - 1]) { 
            '=' {
                [Microsoft.PowerShell.PSConsoleReadLine]::Delete($cursor - 1, 1)
                [Microsoft.PowerShell.PSConsoleReadLine]::Insert("-eq")
            }
            '!' {
                [Microsoft.PowerShell.PSConsoleReadLine]::Delete($cursor - 1, 1)
                [Microsoft.PowerShell.PSConsoleReadLine]::Insert("-ne")
            }
            '<' {
                [Microsoft.PowerShell.PSConsoleReadLine]::Delete($cursor - 1, 1)
                [Microsoft.PowerShell.PSConsoleReadLine]::Insert("-le")
            }
            '>' {
                [Microsoft.PowerShell.PSConsoleReadLine]::Delete($cursor - 1, 1)
                [Microsoft.PowerShell.PSConsoleReadLine]::Insert("-ge")
            }
            '&&' {
                [Microsoft.PowerShell.PSConsoleReadLine]::Delete($cursor - 1, 1)
                [Microsoft.PowerShell.PSConsoleReadLine]::Insert("-and")
            }
            '||' {
                [Microsoft.PowerShell.PSConsoleReadLine]::Delete($cursor - 1, 1)
                [Microsoft.PowerShell.PSConsoleReadLine]::Insert("-or")
            }
            default {
                [Microsoft.PowerShell.PSConsoleReadLine]::Insert("=")
            }
        }
    }
    Set-PSReadLineKeyHandler -Chord 'Spacebar' -BriefDescription "Comparison Operators w/o =" -ScriptBlock {
        param($key, $arg)
        $line = $null
        $cursor = $null
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        if ($line[$cursor - 1] -eq '<') { 
            [Microsoft.PowerShell.PSConsoleReadLine]::Delete($cursor - 1, 1)
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert('-lt ')
        }
        elseif ($line[$cursor - 1] -eq '>') { 
            [Microsoft.PowerShell.PSConsoleReadLine]::Delete($cursor - 1, 1)
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert('-gt ')
        }
        else { 
            [Microsoft.PowerShell.PSConsoleReadLine]::Insert(' ')
        }
    }
}
