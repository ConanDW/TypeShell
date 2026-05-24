using System.Management.Automation;
namespace TypeShell;

[Cmdlet(VerbsData.New, "Request")]
public class Request : PSCmdlet
{
    [Parameter(Mandatory = true, Position = 0)]
    public string Uri { get; set; }

    [Parameter(Mandatory = true, Position = 1)]
    public string Method { get; set; }

    [Parameter(Mandatory = true, Position = 2)]
    public Dictionary<string, dynamic> Headers = new();
    
    [Parameter(Mandatory = false, Position = 3)]
    public Dictionary<string, dynamic> JsonBody = new();

    [Parameter(Mandatory = true, Position = 4)]
    public string ContentType { get; set; }

    if (Method == "Get") 
    {
        GetRequest get = new GetRequest();
    } 
    elseif (Method == "POST") {
        
    }

}