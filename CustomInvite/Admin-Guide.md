# Installation
## Supported Software
CustomInvite is a VSTO Add-in for Microsoft Outlook supported on Windows systems running supported versions of
Microsoft Office as below:
* Windows 7, 8, 8.1 and 10
* Microsoft Office 2013, and 2016 – including Click to Run builds from Office365
* Microsoft Office 2016 x64bit
* Microsoft Teams and Skype for Business client

## Prerequisites

CustomInvite requires the following system pre-requisites to be installed:
* Microsoft Outlook, Word and Lync/Skype as minimum components of Office
* Microsoft .NET Framework 4.6 (Client Profile) or above – required for Windows 7 / 8 / 8.1 ONLY
Note: Installation pre-requisites are available for download from Microsoft. At time of publishing – they are available
here: https://www.microsoft.com/en-gb/download/details.aspx?id=48130

## Outlook Slow Start Registry Requirements

In addition to the software pre-requisites, Modality has implement forced start up for Custom Invite in Outlook. This
only affects Outlook 2013 and Outlook 2016.
This can be enabled by adding the below registry settings to the local machine registry:

**_Office 2013_**
HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\15.0\Outlook\Resiliency\DoNotDisableAddinList
REG_DWORD: CustomInvite = 1

**_Office 2016_**
HKEY_CURRENT_USER\SOFTWARE\Microsoft\Office\16.0\Outlook\Resiliency\DoNotDisableAddinList
REG_DWORD: CustomInvite = 1

To simplify the rollout of these registry changes to an enterprise organisation, Modality has produced an ADMX Group
Policy template for CustomInvite. See the Enterprise Management section below.

## Licence Key Requirement

CustomInvite has built in licence protection and requires a licence code to be present before it will function. If no
license code is presented at installation, the tool will install but will silently fail. The user will still be able to schedule
Microsoft Teams and Skype for Business meetings however CustomInvite will not reformat the meeting invitation.
This allows a company to roll out CustomInvite silently with no user disruption – all configuration information
(including the license code) can be provided by Group Policy. For more information on recommendations for this,
please see the Enterprise Management section of this guide.

## Installer Setup and Execution

CustomInvite is a VSTO Add-in and the application is available in two MSI packages:
*CustomInvite_Outlookx86.msi – Office x32bit
*CustomInvite_Outlookx64.msi – Office x64bit
This is a standard MSI package that can be deployed using a variety of industry standard means such as script (using
the MSIEXEC command line), Group Policy, or via an SCCM installation package. The method of deployment is very
much dependant on your environment and current policies on software rollout.

**_Stand Alone Installation:_**
The software package may be installed as a stand-alone package by double-clicking on the MSI file and running through
the installation wizard. Registry values may be edited post installation by manually editing values within REGEDIT.

**_Script Installation:_**
When installing via script, registry values may be set by adding parameters. Example:
>MSIEXEC /i “C:\Users\CustomInviteSetup.msi” BaseTemplateName=Default.rtf
NetworkTemplatePath=\\Servername\Development\AppointmentTemplates

**_Group Policy Installation:_**
GPO’s may be used for both deployment and management of CustomInvite. Additional information on using GPO’s for
deployment may be found at: https://technet.microsoft.com/en-us/library/cc771306(v=ws.11).aspx

**_Systems Centre Configuration Manager Installation:_**
Deploying via SCCM is supported. GPO’s may still be set to manage CustomInvite. Additional information on deploying
with SCCM may be found at: https://technet.microsoft.com/en-us/library/gg682164.aspx

## Upgrade Installation:

Modality systems will publish updates to CustomInvite that include feature improvements and product fixes. These
updates are not always mandatory for your implementation, but we do require that customers are using the latest
version when reporting issues. To upgrade an installation of CustomInvite is very simple as the tool fully supports in
place upgrades.

Using your software deployment method of choice, you simply rollout the CustomInvite package in a silent method –
the tool will identify the previous installation, copy the required configuration parameters and install the updated
version. This will take effect when the customer next uses the tool.

Modality will publish release notes with each build to keep customers updated on fixes included in a release. The
latest release contains all fixes from previous builds so there is no need to apply updates in order – only the latest
release is required.

## Registry Values:

CustomInvite uses several registry values to customize the applications functionality and appearance. If parameters
are not configured on installation, then default values will be used. Parameters are stored within the registry at:

**HKEY_LOCAL_MACHINE\Software\Policies\Modality Systems\CustomInvite**

The values that may be set are:
* **CacheDirectory**

Purpose: Defines the location where the CHTML template files are cached on the local machine from the
TemplateDirectory

_Default Value:_ %localappdata%\Modality Systems\CustomInvite

* **DefaultTemplate**

Purpose: Defines the template that CustomInvite will use to automatically reformat the invitation upon creation of
the online meeting

_Default Value:_ Default

* **LicenseCode**

Purpose: Presents the License Code used by CustomInvite

_Default Value:_ BLANK – CustomInvite needs a valid licence key to reformat the meeting invitation

* **TemplateDirectory**

Purpose: Network location where centrally distributed templates are stored. CustomInvite will cache files from this
location to the local machine whenever CustomInvite loads.

_Default Value:_ C:\Program Files (x86)\Modality Systems\CustomInvite\Resources
Client Confidential

* **Version**

Purpose: Confirmation of the version of CustomInvite currently installed on the PC

_Default Value:_ CustomInvite version number

## CustomInvite ADMX template:
Modality has made available an Enterprise ADMX file that can be added to your organisations PolicyDefinitions
directory. This allows enterprise configuration of the CustomInvite tool registry settings via a centrally managed
group policy configuration.

(/images/ADMX-template.png)

# Enterprise Management

## Recommended approach: 
CustomInvite has been designed to support large enterprise deployments where templates, licences and distribution
are managed centrally. To use CustomInvite, each user will need the plugin installed in Outlook and a template cached
locally on their machine to control the format of the meeting invitation.

## CustomInvite behaviour:
Upon starting Outlook, CustomInvite will download the contents of the folder path defined in the
NetworkTemplatePath registry key to the %localappdata%\Modality Systems\CustomInvite folder on the local PC. The
defined behaviour is that CustomInvite will never delete any files on the local machine, it will only replace or add to
the existing ones. This is to ensure that there is always a template available to the user if for any reason, CustomInvite
cannot connect to the **NetworkTemplatePath** directory.

For the standalone MSI file, this path is set to the C:\program files\Modality Systems\CustomInvite\Resources folder
containing the 5 example templates shipped with CustomInvite.

_Note: To delete any unwanted templates, these need to be deleted from the users’ localappdata folder on their local
machine._

## Create a central folder for the templates:
To manage CustomInvite templates centrally, these need to be stored in a central server location that can be accessed
by all users. The resulting UNC path will be used by CustomInvite to find the templates to cache locally to the machine.
Modality will provide a RTF template which needs to be saved in this folder.

## Install the CustomInvite software silently:
It is possible to install CustomInvite silently so there is no disruption to the user during install. This method also allows
you to control activation and enable specific groups of users which is ideal for proof of concepts or phased
deployments of the software.

When installing CustomInvite, add a parameter setting the NetworkTemplatePath to the central file store so that it
never sees the local resources folder. Make sure that the DisplayErrorMessages parameter is set to Off and the
NetworkTemplatePath parameter is set to the central directory containing the folder. Installing by command line
would look like the below example: 
>msiexec.exe /i c:\path\to\custominvite.msi /quiet
DisplayErrorMessages=Off NetworkTemplatePath=\\network\unc\path

_Note: To avoid the default templates caching to all users, is to ensure the **NetworkTemplatePath** key is set
BEFORE the user loads CustomInvite for the first time._

**Deploy Group Policy:**
Once CustomInvite is installed across your estate, you can use group policy to control activation of the software and
the way in which templates are distributed to users.

Create a group policy populate the **LicenceKey**, **TemplateDirectory** and **DefaultTemplate** for users to activate
CustomInvite.

# Templates

CustomInvite 3.0 uses CSHTML templates to control the format of meeting invitation. The template files use
standard HTML/CSS to determine the formatting and layout of the invitation along with a series of placeholders used
to display the information generated by Teams or Skype for Business.

This section gives an overview of the template structure and examples of how to use these:

## Formatting models:
CustomInvite templates can determine the formatting of all types of Microsoft online meetings. The CustomInvite
templates identify whether the meeting created is Skype for Business or Teams meeting and apply the relevant
formatting model based on the formatting in the template.

Each template can contain formatting details for multiple types of meetings which allows you to have one template
that contains individual control over the format of Teams, Skype for Business online and Skype for Business server
meetings.

Below is an example template structure containing formatting layout for both Teams and Skype for Business online
meetings:

_@if (Model.Teams.IsEnabled)
{
If CustomInvite detects the meeting created is a Teams meeting, it will format the meeting based on the HTML
information between these two brackets.
}
@if (Model.Sfbs.IsEnabled)
{
If CustomInvite detects the meeting created is a Skype for Business server meeting, it will format the meeting based
on the HTML information between these two brackets.
}_

The formatting models available are:

Teams - Model.Teams

Skype for Business online - Model.Sfbo

Skype for Business server - Model.Sfbs

## Microsoft Teams Formatting Model:
**Placeholder Details:**
CustomInvite uses placeholders to control where the different elements of the meeting appear in the meeting
invitation. These placeholder tags combined with HTML/CSS formatting enable CustomInvite to deliver a fully
customised version of the Teams and Skype for Business meeting invitation.

**Standard placeholder tags:**
CustomInvite assigns the standard Teams online meeting join information to a series of placeholder tags which can
be referenced in the CustomInvite HTML template.

Placeholder Name | Function
---------------- | --------
@Model.Teams.JoinMeetingUrl | Join Teams Meeting URL
@Model.Teams.ConferenceId | Teams Meeting Conference ID
@Model.Teams.LocalNumbersUrl | Standard Local PSTN number URL
@Model.Teams.MeetingOptionsUrl | Teams Meeting options URL

**Group tags:**
CustomInvite uses group tag containers to present and filter the PSTN dial in numbers available to dial in to the
meeting. These can be included in the template and set to only display in the invitation if the user is enabled for the
functionality.

**Microsoft Phone System PSTN dial in numbers:**
**Model.Teams.DialInNumbers** is the name of the model for the PSTN dial in number selection
CustomInvite can display the following information for all the Microsoft Phone System PSTN numbers available to
users scheduling Teams meetings.

Placeholder Name | Example Output (for UK London)
---------------- | ------------------------------
FormattedNumber: | +44 20 3880 0559
Number: | +442038800559
City: | London
Country: | United Kingdom
IsoCode: | GB
DisplayName: | United Kingdom, London

CustomInvite can also identify which numbers are toll-free and those numbers assigned as the default numbers to
the user scheduling the meeting.
These values can be also be used by CustomInvite to filter which numbers to display for a user based on their
settings allowing templates to dynamically display details rather than the basic approach of toll and toll-free being
the only displayed numbers.
Below is an example of the template code to display the default numbers assigned to a user. The data being
returned is the Number and Conference ID making up a single click dial URL and the Formatted Number for each
number assigned as default to that user.

_@foreach (var number in Model.Teams.DialInNumbers.Where(x => x.IsDefault).OrderBy(x => x.IsTollFree))
{
<a>href=tel:@number.Number,,@Model.Teams.ConferenceId#>@number.FormattedNumber</a>&nbsp@it
em.DisplayName
 }
This example shows the code to display the same data but for a specific range of numbers based on the GB and US
ISOCode:
@foreach(var number in Model.Teams.DialInNumbers.Where(x => x.IsoCode == "GB" || x.IsoCode ==
"US").OrderBy(number => number.Country))
{
<a>href=tel:@number.Number,,@Model.Teams.ConferenceId#>@number.FormattedNumber</a>&nbsp@it
em.DisplayName
 }_
 
**Teams native video interop tags:**
**Model.Teams.Pexip.IsVTCEnabled** is the name of the model for the Pexip Teams VTC model.
CustomInvite supports the 3rd party video interop into Teams which can be delivered by one of three certified
providers; Pexip, Polycom or BlueJeans. At present, CustomInvite can display the below information for Pexip and
will support Polycom and BlueJeans in future releases.

Placeholder Name | Function
---------------- | --------
@Model.Teams.VtcSipAddress | VTC SIP Address
@Model.Teams.VtcConferenceID | VTC Meeting ID
@Model.Teams.VtcDialingInstructions | VTC Dialling Instructions URL

if (Model.Teams.Pexip.IsEnabled)
{
PEXIP TEAMS VTC JOIN DETAILS HERE:
}

**Best practice/considerations:**
When viewing Teams meeting invitations in the Teams client, any formatting applied in the Outlook desktop meeting
invitation is not displayed. It retains all the customised layout and additional text/urls however the formatting
applied to the meeting is the default Teams font and colour.

## Microsoft Skype for Business Online Model:
**Standard placeholder tags:**
CustomInvite assigns the standard Skype for Business online meeting join information to a series of placeholder tags
which can be referenced in the CustomInvite HTML template.

Placeholder Name | Function
---------------- | --------
@Model.Sfbo.JoinMeetingUrl | Join Skype for Business meeting URL
@Model.Sfbo.JoinWebMeetingUrl | Join Skype for Business meeting using the webapp URL
@Model.Sfbo.FocusID | Focus ID of the SfB meeting
@Model.Sfbo.ConferenceId | Conference ID
@Model.Sfbo.MorePhoneNumbersUrl | Standard Local PSTN number URL
@Model.Sfbo.HelpUrl | Standard Help URL for Skype for Business meetings

##Group tags:
**Microsoft Phone System PSTN dial in numbers:**
**Model.Sfbo.DialInNumbers** is the name of the model for the PSTN dial in number selection
CustomInvite can display the following information for all the Microsoft Phone System PSTN numbers available to
users scheduling Teams meetings.

Placeholder Name | Example Output (for UK London)
---------------- | ------------------------------
FormattedNumber: | +44 20 3880 0559
Number: | +442038800559
City: | London
Country: | United Kingdom
IsoCode: | GB
DisplayName: | United Kingdom, London
Culture (Language) | English (United Kingdom)

CustomInvite can also apply the below filters to the Microsoft Phone System numbers allowing us to display only toll
free numbers or identify those numbers assigned as the default settings for the user.

Filter | Description | Values
------ | ----------- | ------
IsTollFree: | Identifies if the number is toll or toll free | True/False
IsDefault: | Identifies if the number is assigned as the default for users | True/False

## Microsoft Skype for Business server:
**Standard placeholder tags:**
CustomInvite assigns the standard Skype for Business server meeting join information to a series of placeholder tags
which can be referenced in the CustomInvite HTML template.

Placeholder Name | Function
---------------- | --------

@Model.Sfbs.JoinMeetingUrl | Join Skype for Business meeting URL
@Model.Sfbs.JoinWebMeetingUrl | Join Skype for Business meeting using the webapp URL
@Model.Sfbs.FocusID | Focus ID of the SfB meeting
@Model.Sfbs.FocusUri | Focus URI of the SfB meeting
@Model.Sfbs.ConferenceId | Conference ID
@Model.Sfbs.MorePhoneNumbersUrl | Standard Local PSTN number URL
@Model.Sfbs.HelpUrl | Standard Help URL for Skype for Business meetings

**Group tags:**
**PSTN dial in numbers:**
**Model.Sfbs.DialInNumbers** is the name of the model for the PSTN dial in number selection of the Skype for Business
server invitation. Allows CustomInvite to display the PSTN dial in details based on those numbers assigned to the
user based on the dial plan assigned to them in the Skype for Business server control panel.

These numbers will also update based on the region selected in the meeting options section of the meeting.

CustomInvite can display the following information for each PSTN number selected in the meeting invitation:

Placeholder Name | Example Output (for UK London)
---------------- | ------------------------------
Number: | St Albans: +44 (0)20 3300 1373
Region: | Modality EMEA
Culture (Language) | English (United Kingdom)

CustomInvite can also apply the below filters to the on-prem conferencing PSTN numbers:

Filter | Description | Values
------ | ----------- | ------
IsTollFree: | Identifies if the number is toll or toll free | True/False
IsDefault: | Identifies if the number is assigned as the default for users | True/False
IsSelected: | Identifies if the number is part of the region selected for the meeting | True/False

# Managing Template Distribution
Files paths and UNC’s may be used to provide a central template repository. C:\Templates as well as
\\FileShare\Templates are both valid. FTP, HTTP, and other URL based downloads are not supported.

For CustomInvite to update templates from a central repository, the TemplateDirectory registry key must be
configured to do so. For example, if the registry keys are set as shown below, CustomInvite will set the file called
**Default** as default once cached from the network location **\\TemplateShare\Global.**

DefaultTemplate = Default

TemplateDirectory = \\TemplateShare\Global



