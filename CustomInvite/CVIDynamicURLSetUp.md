# CVI Dynamic URL set up

## Pre-requisites

* CustomInvite version >= 3.6
* CustomInvite is installed
* Working License Key
* CVI Policies set up against clients/users

## CVI Dynamic URL

In order for CustomInvite to work with the CVI (set-up within the tenant and assigned to clients/users policies) a CVI URl format is required in the registry. If CVI is set-up for your client, in order for it to be enabled and work in CustomInvite the URL format will need to be assigned to the "CviUrlFormat" value within the registry.

CviUrlFormat should be the identical to your CVI url, but with the ConferenceId value replaced with the placeholder *"{ConfId}"*. This is the same as the url used to build CVI policies via PowerShell.

For example:

CVI URL | CviUrlFormat value
--- | ---
<https://teams-supertap-joininfo.pexip.com/?conf=1173186780&direct=1133901366&key=teams%40videosrv.net> | <https://teams-supertap-joininfo.pexip.com/?conf={ConfId}&direct=1133901366&key=teams%40videosrv.net>
<https://pexip.me/teams/vc.cslbehring.com/1118642363> | <https://pexip.me/teams/vc.cslbehring.com/{ConfId}>

CustomInvite searches for links in the meeting body that match the CviUrlFormat. Links that match the CviUrlFormat must have the same host and path, and the ConferenceId must be in the position defined by the *{ConfId}* placeholder. The query string can differ as long as the ConferenceId query string key matches, if it exists.

On install CviUrlFormat will be added to the registry with a blank default value. If the value is left blank, any CVI links that are generated natively will not match with a blank value and therefore any CVI information in the template will not be rendered.
