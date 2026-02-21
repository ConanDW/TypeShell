# TypeShell

PowerShell is great. But let's be honest, the syntax is odd. Why do I need `-eq` instead of `==`? Why can't I just declare a variable with a type like every other language? Why is `Write-Output` so many characters? It's just weird.

TypeShell fixes that. It's a PowerShell 7 module that sits on top of your existing shell and transpiles a more familiar, strongly-typed syntax into native PowerShell in real time, as you type.

No new runtime. No breaking changes. Just PowerShell, with less friction.

## What It Does

When you type this:

```
string name = "Cameron"
int count = 42
const string greeting = "hello"
```

TypeShell turns it into this before PowerShell ever sees it:

```powershell
[string]$name = "Cameron"
[int]$count = 42
New-Variable -Name greeting -Value ([string]"hello") -Option Constant
```

Same thing with operators. Type `==` and it becomes `-eq`. Type `!=` and it becomes `-ne`. Type `>` and it becomes `-gt`. You get the idea.

### Supported Types

| TypeShell | PowerShell |
|-----------|------------|
| `string name = "hi"` | `[string]$name = "hi"` |
| `int count = 5` | `[int]$count = 5` |
| `bool flag = $true` | `[bool]$flag = $true` |
| `float pi = 3.14` | `[float]$pi = 3.14` |
| `double val = 1.23` | `[double]$val = 1.23` |
| `const string x = "hi"` | `New-Variable -Name x -Value ([string]"hi") -Option Constant` |

### Operators

Just use what you already know from literally every other language:

| You type | PowerShell gets |
|----------|----------------|
| `==` | `-eq` |
| `!=` | `-ne` |
| `>` | `-gt` |
| `<` | `-lt` |
| `>=` | `-ge` |
| `<=` | `-le` |

### Aliases

Because `Write-Output` is too many keystrokes:

| Alias | Command |
|-------|---------|
| `Print` | `Write-Output` |
| `PrintError` | `Write-Error` |
| `PrintWarning` | `Write-Warning` |
| `PrintVerbose` | `Write-Verbose` |
| `PrintDebug` | `Write-Debug` |

## Requirements

- **PowerShell 7.0+** — this won't work on Windows PowerShell 5.1
- **PSReadLine** — ships with PowerShell 7 by default, so you're probably fine

## Getting Started

```powershell
# Import the module
Import-Module TypeShell

# Turn on TypeShell
Enable-TypeShell

# Now just type normally
string name = "Cameron"
int age = 25
Print "hello world"

# Turn it off when you're done
Disable-TypeShell
```

That's it. No config files, no build steps, no ceremony.

## How It Works

TypeShell hooks into PSReadLine's key handlers. When you press Enter, it checks your input against a set of regex patterns. If something matches, it swaps in the PowerShell equivalent before the line gets executed. If nothing matches, it just submits the line normally. Your shell keeps working exactly like it always did, TypeShell only kicks in when it recognizes its own syntax.

Operators work similarly, but they trigger on the `=` key and Spacebar so the conversion happens as you type, not when you submit.

## Project Structure

```
TypeShell/
├── TypeShell.psd1          # Module manifest
├── TypeShell.psm1          # Module loader
├── public/
│   ├── Enable-TypeShell.ps1
│   └── Disable-TypeShell.ps1
├── private/
│   ├── Types.ps1           # Type declaration transpiler
│   ├── Operators.ps1       # Operator transpiler
│   └── BaseAliases.ps1     # Cmdlet aliases
└── src/                    # C# engine (in development)
```

## Roadmap

There's a lot more coming.

- [ ] Pipeline shortcuts (`it` → `$_`)
- [ ] Simpler string interpolation
- [ ] Simpler null checks
- [ ] Line continuation with `\` instead of backtick
- [ ] Improved Match expressions
- [ ] Array/hashtable syntax shortcuts
- [ ] Native error handling

Along with a C# transpiler engine so that you can write TypeShell scripts natively.

## Author

**Cameron Day**

## License

(c) Cameron Day. All rights reserved.
