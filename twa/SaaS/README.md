# Setting up Teamwork Analytics SaaS

Modality Systems Teamwork Analytics SaaS is very simple to setup. Modality Systems has the following two authorisation URLs which must be approved by your Azure Active Directory Global Administrator. 

 - To authorize Automation and Reporting SaaS for use in your environment [click here](https://mod.qa/ReportConsent).
 - To authorize CreateTeam SaaS for use in your environment [click here](https://mod.qa/CreateTeamConsent).

Once approved Teamwork Analytics will collect reporting information. To view your reports you will need to download the Power BI reports from Microsoft App Source and connect them to the SQL reporting database URL that Modality Systems provides

PowerBI apps are available from [Microsoft AppSource](https://modalitysoftware.com/twa)

Steps for how to configure Power BI are [here](/twa/PowerBIAppsAdminInstallGuide.md)

Each customer install has a unique database run in a dedicated Modality CSP Azure tenant.

Automation will be off by default, but can be configured by Modality Systems to meet your specific requirements.
