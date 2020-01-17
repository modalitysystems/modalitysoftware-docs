# Changing Feature Flags

Teamwork Analytics allows you to change feature flags that decide what data is collected. These can be changed from the config file found in the default installation path. By setting their respective values to either 'true' or 'false' you can toggle these features on or off.

>`C:\Program Files\Modality\NotificationService\TeamworkAnalytics.NotificationService.ConsoleApp`

- **IncludeYammerData** - with this enabled the YammerDataToken is used to collect data from Yammer. You will also need this included in your TWA License.
- **IncludeFiles** - collection of file data from Graph.
- **IncludeFilePermissions** - if IncludeFiles is set to true then you can also set whether their permissions data per file is also collected. 

![configFeatureFlags](images/ConfigFeatureFlags.png)