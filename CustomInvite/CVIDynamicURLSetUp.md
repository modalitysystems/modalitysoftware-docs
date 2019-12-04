# CVI Dynamic URL set up

<!-- Foobar is a Python library for dealing with word pluralization. -->

## Pre-requisites

CustomInvite has been installed and a policy has been set up.
<!-- 
Use the package manager [pip](https://pip.pypa.io/en/stable/) to install foobar.

```bash
pip install foobar
``` -->

## CVI Dynamic URL

As part of the onboarding process you need to inform CustomInvite of the format of your CVI url. This is done by adding a CviUrlFormat to your CustomInvite policy registry with the name CviUrlFormat.

CviUrlFormat should be the identical to your CVI url, but with the ConferenceId value replaced with the placeholder *"{ConfId}"*. This is the same as the url used to build CVI policies via PowerShell.

For example:

CVI URL | CviUrlFormat value
--- | ---
<https://teams-supertap-joininfo.pexip.com/?conf=1173186780&direct=1133901366&key=teams%40videosrv.net> | <https://teams-supertap-joininfo.pexip.com/?conf={ConfId}&direct=1133901366&key=teams%40videosrv.net>
<https://pexip.me/teams/vc.cslbehring.com/1118642363> | <https://pexip.me/teams/vc.cslbehring.com/{ConfId}>

CustomInvite searches for links in the meeting body that match the CviUrlFormat. Links that match the CviUrlFormat must have the same host and path, and the ConferenceId must be in the position defined by the *{ConfId}* placeholder. The query string can differ as long as the ConferenceId query string key matches, if it exists.

On install CviUrlFormat will be added to the registry with a blank default value. If the value is left blank, no CVI links will be found and therefore CVI link will be rendered.
