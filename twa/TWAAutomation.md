# Teamwork Analytics Automation - Overview & Requirements

## Overview

Teamwork Analytics Automation (TWA Automation) enables you to send automated messages direct to users via email or Microsoft Teams, enforcing compliance and data security.

![TWA Architecture](images/twa-architecture.png)

TWA Automation is deployed in two parts: a locally run Bot Notification Service, and a Modality-managed cloud solution that brokers and delivers messages to users.

## Pre-requisites

* You must already be running Teamwork Analytics.
* The local Bot Notification Service can be run on the same instance as the TWA Collector Service. It is configured with its own schedule, set up in Task Scheduler.
* The machine running the Bot Notification Service will need HTTPS 443 outbound access in order to message the Modality-managed broker service.
* Modality Systems will provide the manifest file for a Microsoft Teams application, to be side-loaded by an tenant administrator. Read more about [Publishing a custom app by uploading an app package](https://docs.microsoft.com/en-us/MicrosoftTeams/upload-custom-apps).

## Experience

Today, TWA Automation supports 4 automation scenarios: Team Ownership, Guest Report, Inactive Team, Deleted Team. Read more about [each scenario](http://docs.modalitysystems.com/twa/TWA-Bot-Scenarios).

The frequency of notification is configurable. When a user is eligable for a message it is sent by either email or Microsoft Teams 1-to-1 chat message, depending on the user preference. By default, messages are sent by email unless the user opts-in to receiving them by Teams chat.

# Upcoming Changes

Some changes are planned to TWA Automation, in order to enable pro-active messages to be sent to users as Teams 1-to-1 chat messages by default. This will require an additional permission to be consented by a tenant administrator:

*TeamsAppInstallation.ReadWriteForUser.All* - Allows the app to read, install, upgrade, and uninstall Teams apps for any user, without a signed-in user. Does not give the ability to read application-specific settings.

If this permission is not granted, the default behavoir will be to send an email, with the user opting in to receiving a Microsoft Teams chat.
