# Teams Admin Centre (TAC)

## Teams User Activity Report

Microsoft have official documentation [here](https://docs.microsoft.com/en-us/microsoftteams/teams-analytics-and-reports/user-activity-report). Our findings indicate the documentation to be incorrect for the most part, find below our reasons. The headline numbers contradict the per user csv report download for the most part. The definitions of some columns in the csv report contradict themselves. The graph contradicts both the headline numbers and the csv report. Exercise caution and refer to this guide where possible.

Where metrics are comparable between TAC and TWA Performance, SQL is provided for your own comparison. Running these queries could put significant load on your SQL server due to the large aggregations they are computing. Where possible, run the queries against a replica. Seek advice from us if you are unsure.

### Headline numbers

![TAC overview](images/tac-overview.png)

#### Channel messages, Reply messages, Post messages, Chat messages

<img src="images/no.png" width="25" height="25"> TWA Support - Out of scope.

#### Total Meetings Organized

The number of meetings organised.

<img src="images/yes.png" width="25" height="25"> TWA Support - [SQL Validation](tac-sql/total-meetings-organised.sql).

#### Total Meetings Participated

The unqiue number of meetings joined if 2 users joined the same meeting, this represents 1 meeting joins, not two.

<img src="images/yes.png" width="25" height="25"> TWA Support - [SQL Validation](tac-sql/total-meetings-participated.sql).

#### 1:1 Calls

The unique number of 1:1 calls. Also known as Peer 2 Peer (P2P) calls, not meetings. It does not equal any number in the per user report. 

<img src="images/warning.png" width="25" height="25"> TWA Support - TWA does not exclude voicemail calls, this is currently skewing the numbers - [SQL Validation](tac-sql/p2p-calls.sql).

#### Audio Time

The number of audio minutes the users in your tenant are involved in (send, receive or both) 

- If you were in a call or conference and were on mute for the duration, your send audio minutes would be 0. 
- If you were in a call or conference and were receiving audio, your receive audio minutes would be the duration of your participation in that call or meeting
- If you were in a call or conference and were on mute and receiving audio, your total audio minutes for that call or conference would be the duration of your participation in that call or meeting
- If you were in a call or conference and were on mute for the duration and not receiving audio, your total audio minutes for that call or conference would be 0.

To calculate total audio time, each users total audio time for each call is summed. The result is Audio Time, or total audio time.

<img src="images/warning.png" width="25" height="25"> TWA Support - TWA does not include "receive only" minutes, this is currently skewing the numbers - [SQL Validation](tac-sql/audio-minutes.sql).

#### Video Time

The same logic as Audio time, but for the video modality. 

<img src="images/warning.png" width="25" height="25"> TWA Support - TWA does not include "receive only" minutes, this is currently skewing the numbers - [SQL Validation](tac-sql/video-minutes.sql).

#### Screen Share Time

The same logic as Audio time, but for the screen/app share modality. 

<img src="images/warning.png" width="25" height="25"> TWA Support - TWA does not include "receive only" minutes, this is currently skewing the numbers  - [SQL Validation](tac-sql/app-share-minutes.sql).

### The Graph

![TAC graph day](images/tac-graph-day.png)

If you hover over a day, the number presented is incorrect. It is a significantly different than the weeks total (even after diving by 7), it does not add up to any number in the TAC per user report or TWA Performance. It therefore stands to reason the graph itself is completely incorrect.  Please ignore these numbers and refer to the TAC per user CSV download or TWA Performance reports.

<img src="images/no.png" width="25" height="25"> TWA Support - Invalid Metric.

### Per User CSV Download

Download the file

![TAC User CSV](images/tac-user-csv.png)

This will give you a csv like this

![TAC User CSV Download](images/tac-user-csv-download.png)

#### ChannelMessages, ReplyMessages, PostMessages, ChatMessages, UrgentMessages

<img src="images/no.png" width="25" height="25"> TWA Support - Out of scope.

#### Total Meetings

If you sum this column, you end up with a number that doesn't correspond with any number in the headlines, nor any combination of columns in the per user report. It is unknown what this number actually represents.

<img src="images/no.png" width="25" height="25"> TWA Support - Invalid Metric.

#### Meetings Organised Scheduled

If you sum this column, we can only assume this is the number of scheduled meetings organised. 

<img src="images/no.png" width="25" height="25"> TWA Support - TWA does not currently differentiate between scheduled and adhoc.

#### Meetings Organised Adhoc

If you sum this column, we can only assume this is the number of adhoc meetings organised. 

<img src="images/no.png" width="25" height="25"> TWA Support - TWA does not currently differentiate between scheduled and adhoc.

#### Total Meetings Organised

The number of meetings organised.
If you sum this column, you get the Meetings Organised number from the headlines above (or very close to).

<img src="images/yes.png" width="25" height="25"> TWA Support - [SQL Validation](tac-sql/total-meetings-organised.sql).

#### Meetings Participated Scheduled

If you sum this column, we can only assume this is the number of per user scheduled meetings participated. 

<img src="images/no.png" width="25" height="25"> TWA Support - TWA does not currently differentiate between scheduled and adhoc.

#### Meetings Participated Adhoc

If you sum this column, we can only assume this is the number of per user adhoc meetings participated. 

<img src="images/no.png" width="25" height="25"> TWA Support - TWA does not currently differentiate between scheduled and adhoc.

#### Total Meetings Participated

The number of meetings joined (not unique meeting count). if 2 users joined a meeting, this represents 2 meeting joins, not one.

<img src="images/yes.png" width="25" height="25"> TWA Support - [SQL Validation](tac-sql/total-meetings-participated.sql).

#### 1:1 calls

If you sum this column, you get a number different to the 1:1 number from the headlines above. We believe this is mainly because the headline figure is a unique count of 1:1 calls, whereas the per user report is a count of per user 1:1 call participation. It is not exactly double, because some 1:1 calls are with external users, the CSV download "mostly" does not contain external users or phone numbers. 

<img src="images/yes.png" width="25" height="25"> TWA Support - [SQL Validation](tac-sql/p2p-calls-joined.sql).

#### Audio Time
If you sum this column you get the audio time number from the headlines above.

<img src="images/warning.png" width="25" height="25"> TWA Support - TWA does not include "receive only" minutes, this is currently skewing the numbers - [SQL Validation](tac-sql/audio-minutes.sql).

#### Video Time

If you sum this column you get the video time number from the headlines above.

<img src="images/warning.png" width="25" height="25"> TWA Support - TWA does not include "receive only" minutes, this is currently skewing the numbers - [SQL Validation](tac-sql/video-minutes.sql).

#### Screen Share Time

If you sum this column you get the screen share time number from the headlines above.

<img src="images/warning.png" width="25" height="25"> TWA Support - TWA does not include "receive only" minutes, this is currently skewing the numbers  - [SQL Validation](tac-sql/app-share-minutes.sql).
