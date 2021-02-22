# Comparing Calls in TWA Performance with Microsoft Teams Admin Center

## Single user comparison test

### Teams Admin Center

Navigate to the Teams Admin Center > Analytics & Reports > Usage Reports. Generate a **Teams user activity** report for the Last 7 Days:

Make a note of the Date range used in the report.

Choose a user from the table in the report to use for the test. This can be any user with a non-negative number of either __Meetings participated__ or __1:1 calls__.  
Make a note of the total number of calls this user has made (the total of the Meetings participated and 1:1 calls).

Click the name of the user to open their User profile. Their unique User ID is shown in the URL address bar after the prefix __https://admin.teams.microsoft.com/users/__ and before the suffix __/account__.
Make a note of this User ID.

At this point you should have the following information from Microsoft Teams Admin Center:

Date Range: Nov 27, 2020 - Dec 3, 2020

| User          | User ID       | Calls  | Meetings  |
| ------------- |:-------------:| ------------:| ------------:|
| Example User  | b3e9cd6d-1db8-4173-a1eb-2cdd0bf21347 | 37 | 67 |

### TWA Performance Module

Using an appropriate account, connect to your TWA Performance SQL Database instance.

Modify the following SQL Statement:

```SQL
DECLARE @userid varchar(max) = 'f319a393-056a-4c43-8f03-d4215e95fafb' 
DECLARE @startDate date = '2021-02-05'
DECLARE @endDate date = '2021-02-12'

SELECT 
      [CallId]
	  ,case CallType when 1 then 'P2P' else 'Conference' end as CallType
	  ,[SegmentStart]
      ,  [SegmentEnd]
	  
  FROM [dbo].[Streams] s
  JOIN	[dbo].[Users] u on u.Id = s.UserId And u.Id = @userid
  and convert(date,[SegmentStart]) between @startDate and @endDate
  group by
      [CallId]
	  ,CallType
	  ,[SegmentStart]
      ,  [SegmentEnd]
  order by [SegmentStart]
```

- set the value of the @userID variable in line 1 to the User ID collected previously.
- set the start and end dates to match the date range collected previously. Be sure to use the appropriate notation for your collation (default: yyyy-mm-dd)

Execute the SQL Statement.

### Reviewing the results

The total number of rows returned by the SQL Statement should match the total number of calls from the Teams Admin Center.

If there is a discrepancy, then looking at the detail of calls in each source can help. The SQL Statement returns a row for each call, together with date and time.

On the Teams Admin Center User Profile page, the Call History tab lists calls made by that user. 

Comparison of these two detailed sources can be used to identify calls showing in one location and not the other. To identify calls between the two platforms the Call ID is a common identifier which can be used to identify individual calls. The Call ID is shown in the SQL Statement results. In the Teams Admin Center, in the list of a specific user's Call History, clicking the date-time will open the call detail. In the URL of this page, the Call ID is surfaced.
