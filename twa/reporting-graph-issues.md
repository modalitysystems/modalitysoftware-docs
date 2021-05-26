## Data Issues with Microsoft Teams user activity > Get user detail Endpoint. *

Documentation for the Endpoint can be found here;

https://docs.microsoft.com/en-us/graph/api/reportroot-getteamsuseractivityuserdetail?view=graph-rest-1.0

### Issue Identified

The values returned by the API do not match correctly when you compare a period (either 7, 30, 90 or 180 days) to the data returned for each day in that period. The issue is across the following columns

* Team Chat Message Count
* Private Chat Message Count
* Call Count
* Meeting Count

We have seen these values vary by up to 20%, and they are consistently different - in my experience, I have not seen these values match.

We would expect that if you added together counts for each day in a period, they would sum to be equal to the aggregated period values. 

### Reproduction

The issue is fairly simple to replicate, I used the following method.

1. Download the report csv for a period (7 days in my example), and sum the values in the 4 count columns.
2. Download the report for each day within the period, and for each one, sum the values in the 4 count columns.
3. Finally, sum the values from each day in the period, and you will see that they are different to the values from step 1.

### Worked Example

#### 1. Perform the following Graph API Request

```
GET https://graph.microsoft.com/v1.0/reports/getTeamsUserActivityUserDetail(period='D7')
```

This returns a csv with a report refresh data of 14th September. Summing together the 4 count columns results in this data;

| Team Chat Message Count | Private Chat Message Count | Call Count | Meeting Count |
|---:|---:|---:|---:|
| 1137 | 35769 | 2372 | 2205 |  
 
#### 2. Perform Graph API Requests for each of the 7 days in this period. The requests are as follows;

```
GET https://graph.microsoft.com/v1.0/reports/getTeamsUserActivityUserDetail(date=2020-09-08)
GET https://graph.microsoft.com/v1.0/reports/getTeamsUserActivityUserDetail(date=2020-09-09)
GET https://graph.microsoft.com/v1.0/reports/getTeamsUserActivityUserDetail(date=2020-09-10)
GET https://graph.microsoft.com/v1.0/reports/getTeamsUserActivityUserDetail(date=2020-09-11)
GET https://graph.microsoft.com/v1.0/reports/getTeamsUserActivityUserDetail(date=2020-09-12)
GET https://graph.microsoft.com/v1.0/reports/getTeamsUserActivityUserDetail(date=2020-09-13)
GET https://graph.microsoft.com/v1.0/reports/getTeamsUserActivityUserDetail(date=2020-09-14)
```

The Results from these requests (via summing the 4 count columns) were;

| Date | Team Chat Message Count | Private Chat Message Count | Call Count | Meeting Count |
|---|---:|---:|---:|---:|
| 2020-09-08 | 234 | 7064 | 466 | 433 |
| 2020-09-09 | 201 | 7826 | 438 | 464 |
| 2020-09-10 | 270 | 7295 | 464 | 459 |
| 2020-09-11 | 201 | 6399 | 404 | 392 |
| 2020-09-12 | 4 | 166 | 29 | 13 |
| 2020-09-13 | 23 | 295 | 40 | 18 |
| 2020-09-14 | 225 | 6714 | 527 | 442 |
| **Total** | **1158** | **35759** | **2368** | **2221** |

#### 3. Compare summed results from the daily API to the Period API

In this example, you can see that all of the counts are different. We would expect them to be the same. In previous requests, it has been mentioned that message id's are de-duped, however it is unclear what that means, as how could a message with the same ID be sent on two separate days?

I would also like to note, that whilst performing this test, the values from the 7 day summary endpoint changed, even though it still claimed they were from the same day. The message counts actually decreased also, which was unexpected.
