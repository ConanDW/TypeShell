using System.Collections.Frozen;
namespace TypeShell;

public static class TypesMappings {
    public static readonly FrozenDictionary<string, string> VariableTypes =
    new Dictionary<string, string> {
        {"string", "[string]$"},
        {"int", "[int]$"},
        {"bool", "[bool]$"},
        {"float", "[float]$"},
        {"double", "[double]$"}
    }.ToFrozenDictionary();
    //const is handled separately, it can't just be a rule
}