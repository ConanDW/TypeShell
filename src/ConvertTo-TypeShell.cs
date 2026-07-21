using System.Management.Automation;
using Antlr4.Runtime;
namespace TypeShell;


[Cmdlet(VerbsData.ConvertTo, "TypeShell")]
public class Typeshell : PSCmdlet
{
    [Parameter(Mandatory = true, Position = 0)]
    public required string InputPath { get; set; }
    
    [Parameter(Mandatory = false, Position = 1)]
    public string? OutputPath { get; set; }
    protected override void BeginProcessing() 
    {
        var stream = new AntlrInputStream(File.ReadAllText(InputPath));
        var lexer = new TypeShellLexer(stream);
        var tokens = new CommonTokenStream(lexer);
        tokens.Fill();
        var rewriter = new TokenStreamRewriter(tokens);
        if (OutputPath != null) {
            File.WriteAllText(OutputPath, rewriter.GetText());
        } else {
            Console.WriteLine(rewriter.GetText());
        }
    }
}
//still todo. make it not eat whitespace. make it have a rule to apped a $ to the variable name.
