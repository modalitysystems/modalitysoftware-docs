# TWA Performance - Using Source Data
> This page is intended to assist partner organisations who read source directly from TWA Performance.
## Source Call Records Data
Following a succesful subscription to the Microsoft Call Records API, both notification and payload data that are provided are stored prior to any processing. This means that they are available to be accessed by partner organisations who wish to avoid re-querying Microsoft Graph for the same content.

When the Call Records API provides notification of a new call record, it provides a Uri where that call record can be retrieved from. TWA Performance maintains a record of these URIs, together with the downloaded response. Be aware that this store contains all requests and reponses made to Microsoft Graph, not just those for Call Records.

The Azure Storgae Table "graphresponsemetadata" contains this information: specifically the field **Uri** contains the Microsoft Graph Uri and **ContentUri** provides a locator to download the full response body from Azure Blob Store.

Example Uri: https://graph.microsoft.com/v1.0/communications/callRecords/a3109a41-396e-4fa5-b579-33246551069e?$expand=sessions($expand=segments)

Example ContentUri: https://tdgadlhp7koew3hlxtu.blob.core.windows.net/graph-response-content/95479e35-d62c-4457-9ad5-1baeb3787c7d

The blob content is a Gzip-compressed, Base64-encoded copy of the response received from Microsoft Graph. No alterations, additons or deletions have been made to the file at this point - is it structurally identical to if the file had been downloaded from Microsoft Graph independantly of TWA Performance. The content of the file can be viewed using an online decompression/decoding tool, such as [this one](https://gchq.github.io/CyberChef/#recipe=From_Base64('A-Za-z0-9%2B/%3D',true)Gunzip()).

