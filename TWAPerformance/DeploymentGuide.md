# Teamwork Analytics Performance (Customer Azure Tenant) Deployment Guide

## Before you start

There are a number of required steps to complete before deploying Teamwork Analytics Performance.

As you progress through these steps, make a note of the following three pieces of information which will be required to complete your deployment.

   * Application ID
   * Application Secret
   * Tenant ID

### AAD App 1 (for the API) : Application Permissions

#### Microsoft Graph Permissions

**CallRecords.Read.All** Allows the app to read call records for all calls and online meetings without a signed-in user.

**User.Read.All** Allows the app to read user profiles without a signed in user.

# Steps to install

>[1. Create an Azure Active Directory Application Registration](RegisterApp.md)

>[2. ARM Template Deployment](armDeploy.md)

>[3. Run PowerShell Script to Refresh Functions](RefreshFunctions.md)

---

## Deployment complete

Provided that all steps above have been followed, the Teamwork Analytics Performance deployment should now be complete and ready to use.