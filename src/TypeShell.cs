namespace TypeShell;

public class Typeshell {
    public static void Main(string[] args) {
        Transpiler transpiler = new Transpiler();
        string PowerShellCode = transpiler.Transpile(args[0]);
        Console.WriteLine(PowerShellCode);
        //transpiler.WriteFile(args[1], PowerShellCode);
    }
}
