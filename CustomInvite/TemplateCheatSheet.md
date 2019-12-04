## Template Cheat Sheet

### Adding Images
Although images embedded in HTML can be blocked by Outlook when recieved it is fine to embed images when creating an email.  Outlook will ensure that the inline embedded images is replaced with a more reliable format when the meeting invitation is sent.

#### Steps
1. Use an online embedding tool such as https://codebeautify.org/image-to-base64-converter to create an ````<img>```` tag with 64bit encoded image data in it.
1. Provide a suitable alt element value.

````
<img scr="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEoAAABXCAIAAAAs+kRjAAAAAXNSR0IArs4c6QAAAARnQU1BAACxjwv8YQUAAAAJcEhZcwAADsMAAA7DAcdvqGQAAAKSSURBVHhe7dBLjtwwDAXA3P/Sk1mUABG2u2WTUncC1ZLP4sd/fv5r+7yn/lwQL1E/zBEDPJipcoatb/J4jpruNk3QqFpBXwumaVcq29RqF3zUEVzwUZ1UR0sdiF/y6YG4yPN21olkwzyLZBUqzxPc5HFHUOErdtKiI0irOU81QaNGNW2fd2CFRjVNu0Y1Z593YH6jmqZdo5qzzzswv1FN065RzdnnnbFCo5qgUaOats87Y4uO4BEtOoK0540s0hHc5HFHUKHyvF+yYZ5FsgqpXtY5EL/k0wNxkWw7S53xxYH4jC/qFHS0Wpp2pWqaWjBBo2qVfW16n/cT1Le28gAPZpr55y6Il5g+zE2N6ir7vBxnNaqr7PNynNWorrLPy3FWo7rK+Ty7fDe7vnTykdf/Ahtf2+d9MRtfO//C6+9m15eGPsqwS6O6yj4vx1mN6ir7vBxnNaqr7PNynNWorrLPy3FWo7rKPi/HWY3qKvu8BDd1BKtMnOegSLbKrHmuOeOLJaYMc8c13833mfN++XSy+jHW71wVFygeY/eO4EMXVs6wdSR7l05SNsC+kaxRjWRz1HS3aSSLZJFsgoLWdoxkZ3zREUyQbW3BSHbNdx1BtVRfq0Wyd3zdEZQqPk8wwINIVud5Rxt1BMM8i2RFHrazS0dwk8cdQZEn7SzSETyiRUdQ4XYvK0Syp3TpCNLuNTI8kiVoFMlybnQxNpKlaRfJEkZbGBjJimjaESQMtTAtkpXSuiN46v17cyLZBAZ0BI88OU8whxmR7L43L7XvCGYyKZLd9OqZxh3BfOZFsjsu32gZyZYwsiO44/yNfpFsIYM7gmEnD3SKZGuZHcnGDJ0n+AQbdARj3p+n+jn2aFRH/Pz8BWYzb+pkFjhEAAAAAElFTkSuQmCC" alt="Stick Man Images" />
````

### Display content on PSTN availability for SfBS
````
@if(Model.Sfbs.IsPstnEnabled)
{
   <h3>Join by phone</h3>
   @foreach(var item in Model.Sfbs.DialInNumbers.Where(p => p.IsDefault ))
   {
     \\stuff ...
   }
}
@if(Model.Sfbs.IsPstnEnabled == false)
{
   PSTN Conferencing is not available for this meeting
}
````

### Display SFBS PSTN Numbers for the selected region
Ensure that ````Model.Sfbs.DialInNumbers```` references include a ````Where(p=> p.IsDefault)```` clause
````
 @foreach(var item in Model.Sfbs.DialInNumbers.Where(p => p.IsDefault ))
   {
      item.Number
      item.Region
      item.IsTollFree
      Model.Sfbs.ConferenceId
   }
 ````
 
### Display all SFBS PSTN Numbers regardless of selected region
Simply exclude the ````Where(p=> p.IsDefault)```` clause on ````Model.Sfbs.DialInNumbers````
````
  @foreach(var item in Model.Sfbs.DialInNumbers)
   {
      item.Number
      item.Region
      item.IsTollFree
      Model.Sfbs.ConferenceId
   }
````

### Show SfBS PSTN Numbers for a specified region
````
 @foreach(var item in Model.Sfbs.DialInNumbers.Where(p => p.IsDefault  &&
   p.Region.Equals("India",StringComparison.InvariantCultureIgnoreCase)))
 {
    item.Number
    item.Region
    item.IsTollFree
    Model.Sfbs.ConferenceId
 }
````

### Show SfBS PSTN Numbers for multiple specified regions
The following example displays dial in numbers for UK, US and Germany for the selected dial plan
````
 @foreach(var item in Model.Sfbs.DialInNumbers.Where(p => p.IsDefault  &&  
   p.Region.Equals("UK",StringComparison.InvariantCultureIgnoreCase) ||
   p.Region.Equals("US",StringComparison.InvariantCultureIgnoreCase)  || 
   p.Region.Equals("Germany",StringComparison.InvariantCultureIgnoreCase)))
 {
    item.Number
    item.Region
    item.IsTollFree
    Model.Sfbs.ConferenceId
 }
````

### Show SfBS Toll Free numbers only
````
@foreach(var item in Model.Sfbs.DialInNumbers.Where(p => p.IsDefault && p.IsTollFree))
{
   item.Number
   item.Region
   item.IsTollFree
   Model.Sfbs.ConferenceId
}
````

### Format according to user current culture
1. Add ````@using System.Globalization```` to the top of the template
2. Add the following comparison against the current culture using the ISO 639-2 codes documented at https://en.wikipedia.org/wiki/List_of_ISO_639-2_codes

````
@if(CultureInfo.CurrentCulture.ThreeLetterISOLanguageName.Equals("Ita",StringComparison.InvariantCultureIgnoreCase ))
{
   ...Code if current culture is Italy
}
````


### Show available Teams VTC details
````
@if(Model.Teams.Pexip.IsEnabled)
{
    VTC Conference ID: @Model.Teams.Pexip.ConferenceId
   @Model.Teams.Pexip.SipAddress
   <a href="@Model.Teams.Pexip.DialingInstructionsUrl">Alternate VTC dialing instructions</a>
}
````


