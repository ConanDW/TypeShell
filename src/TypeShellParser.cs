using Parlot;
using Parlot.Fluent;
using static Parlot.Fluent.Parsers;
namespace TypeShell;

class TypeParser
{
    public static readonly Parser<string> _powerShellVar;
    static TypeParser() 
    {
        var type = OneOf(Terms.Text("string"), Terms.Text("int"), Terms.Text("bool"), Terms.Text("float"), Terms.Text("double"));
        var variableName = Terms.Identifier();
        var output = type.And(variableName).Then(x => "[" + x.Item1 + "]$" + x.Item2);
        _powerShellVar = output;
    }


}
class OperatorParser
{
    public static readonly Parser<string> _operator;
    static OperatorParser() 
    {
        var operatorMatches = OneOf(Terms.Text("==").Then(x => " -eq "), Terms.Text("!=").Then(x => " -ne "), Terms.Text(">=").Then(x => " -ge "), Terms.Text("<=").Then(x => " -le "), Terms.Char('>').Then(x => " -gt "), Terms.Char('<').Then(x => " -lt "));
        _operator = operatorMatches;
    }
}
//still todo. make it not eat whitespace. make it have a rule to apped a $ to the variable name.
