namespace TypeShell;

public class Transpiler 
{
    public string ReadFile(string path) 
    {
        string FileToRead = File.ReadAllText(path);
        return FileToRead;
    }
    public string Transpile(string FileToRead) 
    {
        var parser = Parlot.Fluent.Parsers.OneOf(TypeParser._powerShellVar, OperatorParser._operator);
        var parseResult = new Parlot.ParseResult<string>();
        var scanner = new Parlot.Scanner(FileToRead);
        var praseContext = new Parlot.Fluent.ParseContext(scanner);
        var PowerShellCode = "";
        while (!scanner.Cursor.Eof) 
        {
            if (parser.Parse(praseContext, ref parseResult)) 
            {
                PowerShellCode += parseResult.Value;
            } else 
            {
                PowerShellCode += scanner.Cursor.Current;
                scanner.Cursor.Advance();
            }
        }
        return PowerShellCode;
    }
    public void WriteFile(string Path, string PowerShell) {
        File.WriteAllText(Path, PowerShell);
    }
}