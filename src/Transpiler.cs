using System.Text.RegularExpressions;
namespace TypeShell;

public class Transpiler {
    private static readonly Regex TwoCharOperatorsPattern = new Regex(string.Join("|",
        OperatorMappings.TwoCharOperators.Keys.Select(Regex.Escape)), RegexOptions.Compiled);
    private static readonly Regex CharOperatorsPattern = new Regex(string.Join("|",
        OperatorMappings.CharOperators.Keys.Select(k => Regex.Escape(k.ToString()))), RegexOptions.Compiled);
    private static readonly Regex TypePattern = new Regex($@"^({string.Join("|", TypesMappings.VariableTypes)})\s+(\w+)\s*=\s*(.*?)\r?$", 
        RegexOptions.Compiled | RegexOptions.Multiline);
    public string ReadFile(string path) {
        string FileToRead = File.ReadAllText(path);
        return FileToRead;
    }
    public string Transpile(string FileToRead) {
        var PowerShellCode = FileToRead;
        PowerShellCode = TwoCharOperatorsPattern.Replace(PowerShellCode, (m) => OperatorMappings.TwoCharOperators[m.Value]);
        PowerShellCode = CharOperatorsPattern.Replace(PowerShellCode, (m) => OperatorMappings.CharOperators[m.Value[0]]);
        PowerShellCode = TypePattern.Replace(PowerShellCode, "[$1]$$$2 = $3");
        return PowerShellCode;
    }
    public void WriteFile(string Path, string PowerShell) {
        File.WriteAllText(Path, PowerShell);
    }
}