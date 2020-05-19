# Freqeuently Asked Questions 
## General Features
_**What can a business do with CustomInvite?**_

CustomInvite allows the business to modify every Skype for Business meeting invitation in the following ways:
* Text – all text in an invite can be modified
* Location – custom text may be included in the location field
* Links – all hyperlinks may be modified and include custom text
* Images – hyperlink enabled images may be included to reflect your organisation
* Preferred Numbers – Skype for Business presents a range of numbers for use, an administrator can simplify the
invite and push audio to the preferred service (toll based or toll-free)
* Single Click Calling – may include single click all feature (currently supported on iPhone) to allow mobile users to
dial in without looking up conference information
* Language – template selection based on local language as well as an ability to select alternative languages

**What can an administrator do with CustomInvite?**
* Define templates for different business groups, managed via Group Policy.
* Provide configurable defaults for users such as preferred language or preferred numbers

## Supported Environments

_**What version of Lync/Skype for Business is supported with CustomInvite?**_

Lync 2013 and Skype for Business are supported. Both on premise and Office 365 Online.

_**What Operating System and version of Office is supported?**_

Windows 7, 8, 8.1, and 10 operating systems along with Office 2013, and 2016. We also support Office 2016 x64bit
and Office click to run.

_**Are there any other environment considerations?**_
Yes, Windows 7, 8 and 8.1 will require the .net 4.6 installation applying.

## Installation

_**How do I install CustomInvite?**_

CustomInvite is delivered via a packaged MSI file and may be deployed via Group Policy to all domain joined
machines. The MSI file includes various switches and keys to enable silent installation.

_**Are there any pre-requisites for installation?**_

Yes, these are dependent on your operating system and version of Office. For Windows 7, 8 and 8.1 we require the
.net 4.6 installation.

_**How do I remove CustomInvite?**_

If deployed via Group Policy – remove the policy and the MSI will uninstall on next reboot. If deployed manually, you
will be required to remove via the control panel Add/Remove Programs. All invites that have been created using
CustomInvite will remain untouched, all new invites after removal will revert to the default Microsoft configuration.

## User Instructions

_**How do I enable CustomInvite?**_

CustomInvite is automatically active after installation. There is no user interaction required.

_**I installed CustomInvite but my invites appear un-changed?**_

By default, the active template used by the tool replicates the Microsoft default configuration. See troubleshooting
below regarding installation failures or template issues.

_**Can I use alternative languages?**_

Yes, the administrator has the option of presenting various dial-in numbers. A user may simply select an alternative
number for that meeting or the administrator may define this as a new “default” for the user.

_**Can I select an alternative dial-in number?**_

Yes, the administrator has the option of presenting various templates. A user may simply select an alternative
number for that meeting or the administrator may define this as the new “default” for the user.

_**Can I create an alternative invite?**_

Yes, the administrator has the option of presenting various templates. A user may simply select an alternative
template to meet that meetings requirements.

_**Can I create a meeting offline?**_

Yes, CustomInvite will cache the information locally for your default selections enabling offline meeting creation. You
may not modify the invite from the defaults unless you are online. 

## Template Modification

_**I have deployed CustomInvite, how do I update the template?**_

Simply update the reference template in the designated directory (either locally or network location). Note: Once
updated, the new template will be authoritative for all new meetings created. Reoccurring meetings created on
previous templates will not be modified unless the users chooses to do so.

_**Can a user modify the template?**_

Any user with local administrator privileges may access and modify templates. If you have restricted access to these
advanced permissions than users cannot modify the template.

## Troubleshooting
