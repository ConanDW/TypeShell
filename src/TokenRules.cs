namespace TypeShell;


public static class TokenRules {
    public static readonly Dictionary<int, string> operatorRules = new() {
        { TypeShellLexer.OP_EQ, "==" },
        { TypeShellLexer.OP_NE, "!=" },
        { TypeShellLexer.OP_LT, "<" },
        { TypeShellLexer.OP_GT, ">" },
        { TypeShellLexer.OP_LE, "<=" },
        { TypeShellLexer.OP_GE, ">=" },
    };
}