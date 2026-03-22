using System.Management.Automation;
namespace TypeShell;

[Cmdlet(VerbsData.ConvertFrom, "TypeShell")]
public class Typeshell : PSCmdlet 
{
    [Parameter(Mandatory = true, Position = 0)]
    public string InputPath { get; set; }
    
    [Parameter(Mandatory = false, Position = 1)]
    public string OutputPath { get; set; }
    protected override void BeginProcessing() 
    {
        Transpiler transpiler = new Transpiler();
        string FileContent = File.ReadAllText(InputPath);
        string PowerShellCode = transpiler.Transpile(FileContent);
        if (OutputPath != null) {
            transpiler.WriteFile(OutputPath, PowerShellCode);
        } else {
            Console.WriteLine(PowerShellCode);
        }
    }
}
//still todo. make it not eat whitespace. make it have a rule to apped a $ to the variable name.
