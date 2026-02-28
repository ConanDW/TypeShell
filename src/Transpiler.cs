namespace TypeShell;

public class Transpiler {
    public string ReadFile(string path) {
        string FileToRead = File.ReadAllText(path);
        return FileToRead;
    }
    public string Transpile(string FileToRead) {
        var PowerShellCode = FileToRead;
        foreach (var Mapping in OperatorMappings.TwoCharOperators) {
            PowerShellCode = PowerShellCode.Replace(Mapping.Key, Mapping.Value);
        }
        foreach (var Mapping in OperatorMappings.CharOperators) {
            PowerShellCode = PowerShellCode.Replace(Mapping.Key.ToString(), Mapping.Value);
        }
        foreach (var Mapping in TypesMappings.VariableTypes) {
            PowerShellCode = PowerShellCode.Replace(Mapping.Key, Mapping.Value);
        }
        return PowerShellCode;
    }
    public void WriteFile(string Path, string PowerShell) {
        File.WriteAllText(Path, PowerShell);
    }
}