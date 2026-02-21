function Disable-TypeShell {
    [CmdletBinding()]
    [OutputType([void])]
    param()
    Begin {
        Write-Output "Disabling TypeShell"
    }
    Process {
        Remove-PSReadLineKeyHandler -Chord 'Enter'
        Remove-PSReadLineKeyHandler -Chord 'Spacebar'
        Remove-Module -Name TypeShell
        Set-StrictMode -Off
    }
    End {
        Write-Output "TypeShell Disabled"
    }
}