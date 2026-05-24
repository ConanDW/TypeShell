using System.Net.Http.Headers;
using System.Net.Json;

public class GetRequest {
    public List GetRequest(string uri, Dictionary headers) {
        using HttpClient client = new();

        client.DefaultRequestHeaders.Accept.clear();
        client.DefaultRequestHeaders.Accept.Add (new MediaTypeWithQualityHeaderValue(ContentType));

        var RequestData = await ProcessGetRequestAsync(client);
        static async Task<List<RequestData>> ProcessGetRequestAsync(HttpClient client) 
        {
            var json = await client.GetFromJson<List<RequestData>>(Uri);
            return json ?? new List<RequestData>();
        }
    }
}