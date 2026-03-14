using System.Collections.Frozen;
namespace TypeShell;


public static class OperatorMappings {
    public static readonly FrozenDictionary<char, string> CharOperators = 
    new Dictionary<char, string> {
        { '<', "-lt" },
        { '>', "-gt" }
    }.ToFrozenDictionary();

    public static readonly FrozenDictionary<string, string> TwoCharOperators = 
    new Dictionary<string, string> {
        { "<=", "-le" },
        { ">=", "-ge" },
        { "&&", "-and" },
        { "||", "-or" },
        { "==", "-eq"},
        { "!=", "-ne"}
    }.ToFrozenDictionary();
}