## How to access reports

1. [Ensure the user you are signed in with is in the Admin role](ManagingUserRoles.md)
2. Open the Create Team app inside teams
3. Click Administration
4. Click Generate Report
5. Wait up to 5 minutes, do not close the page.
5. Open CSV once downloaded

## How to interpret reports

The report will contain 4 columns
1. Id of the team, this is also the id of the assocaited group in microsoft graph and can be used to query extra data
2. Display Name, the name of the name.
3. Date Created, the date the team was original created in dd-MM-yyyy HH:mm format (time is 24 hours, UTC)
4. Created By, the UPN of the user that created the team via CreateTeam. the report will not show the user if the team was created natively (you can however find this in the O365 Security and Governance audit logs.)

>The report will only contain teams created in the last 90 days

>The report will contain teams created by CreateTeam and natively (excluding the CreatedBy UPN mentioned above)

>The report will only contain teams in the tenant you are currently signed into

>The report will order the teams by date created from newest to oldest (max 90 days)
