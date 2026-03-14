using System.Collections.Frozen;
namespace TypeShell;

public static class TypesMappings {
    public static readonly string[] VariableTypes = {
        "string",
        "int",
        "bool",
        "float",
        "double"
    };
    //const is handled separately, it can't just be a rule
}