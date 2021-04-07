

## Teams Call Logger Power BI Reports (Preview)

Call Logger is a specific set of Power BI reports based on the data from Microsoft Call Records API (https://docs.microsoft.com/en-us/graph/api/resources/callrecords-api-overview?view=graph-rest-1.0). It is a Power BI report pack that is part of Modality Teamwork Analytics.

Microsoft call records API gives details of every media session (audio, video and sharing), both over IP and PSTN calls. Based on this data Call Logger Reports can provide the following:

Total Calls
Total meetings
"Busy hour" / call concurrency reporting
Report on each call made and recieved including caller, callee, start time, end time and duratation
Report on users with no calls or meetings (based on AD user filtered against overall usage)

In Teams/Call Logger a call is any P2P/Users to User scenario, this includes
  - Tenant User to PSTN
  - PSTN to Tenant User
  - Tenant User to Tenant User (VoIP)
  - Tenant User to Federated/external User
  - Federated/External user to Tenant User


Call Logger reports include calls reports on PSTN calls for both direct routing and Microsoft calling plans.

Call Logger reports on all "peer2peer" calls, this includes VoIP and PSTN. It does not report on "meetings" called groupCall in the API (reference https://docs.microsoft.com/en-us/graph/api/resources/callrecords-callrecord?view=graph-rest-1.0)

Power BI can filter reports by:
  - Caller (UPN or PSTN number)
  - Callee (UPN or PSTN number)
  - AD attributes to group caller or callee
  - Date/Time
  - Duration

Note, Tenant users must be filtered by UPN, not their assigned Teams PSTN Number. The Call Records API presents Tenant users by their UPN, not phone number.

Modality has a set of default reports. Customers can edit or create specific Power BI reports if they require.

## Power BI Report Access, Subscriptions and Exporting 

Report Access is controlled by the customer with Power BI Role Based Access Control https://docs.microsoft.com/en-us/power-bi/collaborate-share/service-share-dashboards

Users can subscribe to Power BI reports for email snapshots of reports: https://docs.microsoft.com/en-us/power-bi/consumer/end-user-subscribe

Power BI reports can be exported to excel https://docs.microsoft.com/en-us/power-bi/visuals/power-bi-visualization-export-data

## Report Data Retention

Report data for call logging can be held for as long as the customer requires/defines. Note there are size limits on Power BI reports which may require Power BI premium beyond 1GB of reporting data.https://docs.microsoft.com/en-us/power-bi/admin/service-premium-what-is

## Data not available

Note, the following is not currently available from the Call Records API, so cannot be reported on at this time.

- Costs of calls
- Unanswered calls
- Hold time
- Inbound ring time/wait time for calls or Cloud Auto Attendants/Hunt Groups
- Real Time/Live Call Reports - Call Records API provides data shortly after the end of the call

## Call Logger does not include any performance or quality metrics

Call Logger Reports report on only the call details, not call performance (Packet loss, jitter failed calls, etc.) for call performance reports please see Teamwork Analytics Performance.


