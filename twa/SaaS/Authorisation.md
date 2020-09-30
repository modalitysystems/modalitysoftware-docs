# Authorisation for Teamwork Analytics SaaS

The following steps must be completed with an account with **Azure Active Directory Global Administrator** rights. 

## Reporting permissions

On following the [Reporting authorisation link](https://mod.qa/ReportConsent), you will be prompted to sign in to Office 365 with your admin account.

![Initial sign in](../images/TWASaaS-CT-auth1.png)

Once authenticated, a summary of the app and permissions requested is shown.

![Permissions summary](../images/TWASaaS-Report-auth2.png)

The arrows can be expanded to review further detail for each section.

![Permissions detail](../images/TWASaaS-Report-auth3.png)

Clicking **Accept** will complete the process and show a final page.

![Final splash page](../images/TWASaaS-Report-auth4.png)


## CreateTeam permissions

On following the [CreateTeam authorisation link](https://mod.qa/CreateTeamConsent), you will be prompted to sign in to Office 365 with your admin account.

![Initial sign in](../images/TWASaaS-CT-auth1.png)

Once authenticated, a summary of the app and permissions requested is shown.

![Permissions summary](../images/TWASaaS-CT-auth2.png)

The arrows can be expanded to review further detail for each section.

![Permissions detail](../images/TWASaaS-CT-auth3.png)

Clicking **Accept** will complete the process and show a final page.

![Final splash page](../images/TWASaaS-CT-auth4.png)

## Rolling back / revoking application permissions

Need to remove the permissions that were granted with the authorisation links?

Open the [Azure Portal](https://portal.azure.com) and sign in with your admin accounts.

Navigate to **Azure Active Directory** and click **Enterprise applications**.

![Enterprise applications](../images/TWASaaS-revoke-1.png) 

Click **Teamwork Analytics** and manage **Properties**. Click on the **Delete** button.

![TWA delete](../images/TWASaaS-revoke-3.png)

Click **CreateTeam API** and manage **Properties**. Click on the **Delete** button.

![CT delete](../images/TWASaaS-revoke-2.png)