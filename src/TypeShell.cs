using System.Management.Automation;
namespace TypeShell;

[Cmdlet(VerbsData.ConvertTo, "TypeShell")]
public class Typeshell : PSCmdlet {
    [Parameter(Mandatory = true, Position = 0)]
    public string InputPath { get; set; }
    
    [Parameter(Mandatory = false, Position = 1)]
    public string OutputPath { get; set; }
    protected override void BeginProcessing() {
        Transpiler transpiler = new Transpiler();
        string PowerShellCode = transpiler.Transpile(InputPath);
        Console.WriteLine(PowerShellCode);
        //transpiler.WriteFile(args[1], PowerShellCode);
    }
}
