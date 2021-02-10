# Teams Admin Centre (TAC)

## Teams User Activity Report

### Headline numbers

![TAC overview](images/tac-overview.png)

#### Channel messages, Reply messages, Post messages, Chat messages

Out of scope

#### Meetings Organized

It is unkown what this number actually represents, it does not equal the total meetings organised (scheduled + adhoc) from the per user report, or TWA Performance.

![no](images/no.png) TWA Support

#### Meetings Participated

It is unkown what this number actually represents. It does not equal the total meetings participated (scheduled + adhoc) from the per user report, or TWA Performance. It also does not equal the unique number of meetings joined below ("Total Meetings").

#### Total Meetings

The unique number of meetings joined. It does not equal any number in the per user report. It does match TWA Performance.

#### 1:1 Calls

The unique number of 1:1 calls. Also known as Peer 2 Peer (P2P) calls, not meetings. It does not equal any number in the per user report. It does match TWA Performance.

#### Audio Time

The number of audio minutes the users in your tenant are involved in (send, receive or both) 

- If you were in a call or conference and were on mute for the duration, your send audio minutes would be 0. 
- If you were in a call or conference and were receiving audio, your recieve audio minutes would be the duration of your participation in that call or meeting
- If you were in a call or conference and were on mute and receiving audio, your total audio minutes for that call or conference would be the duration of your paricipation in that call or meeting
- If you were in a call or conference and were on mute for the duration and not receiving audio, your total audio minutes for that call or conference would be 0.

To calculate total audio time, each users total audio time for each call is summed. The result is Audio Time, or total audio time.

It does not equal any number in the per user report. It does match TWA Performance.

#### Video Time

The same logic as Audio time, but for the video modality. It does not equal any number in the per user report. It does match TWA Performance.

#### Screen Share Time

The same logic as Audio time, but for the screen/app share modality. It does not equal any number in the per user report. It does match TWA Performance.

### The Graph

![TAC graph day](images/tac-graph-day.png)

If you hover over a day, the number presented is incorrect. It therefore stands to reason the graph itself is completely incorrect.  Please ignore these numbers and refer to the TAC per user CSV download or Teams Diags reports.

### Per User CSV Download

Download the file

![TAC User CSV](images/tac-user-csv.png)

This will give you a csv like this

![TAC User CSV Download](images/tac-user-csv-download.png)

#### ChannelMessages, ReplyMessages, PostMessages, ChatMessages, UrgentMessages

Out of scope

#### Total Meetings

If you sum this column, you end up with a number that doesnt correspond with any number in the headlines. It does not match TWA Performance.

#### Meetings Organised

If you sum this column, you get the Meetings Organised number from the headlines above (or very close to). You don't get what we believe is the correct number (scheduled + adhoc). Therefore, it is not known what this number actually represents. It does not match TWA Performance. Please see below for "Meetings Organised Scheduled + Meetings Organised Adhoc" for what we believe is the true meetings organised count.

#### Meetings Organised Scheduled

If you sum this column, we can only assume this is the number of scheduled meetings organised. TWA Performance does not collect this metric.

#### Meetings Organised Adhoc

If you sum this column, we can only assume this is the number of adhoc meetings organised. TWA Performance does not collect this metric.

#### Meetings Organised Scheduled + Meetings Organised Adhoc

If you sum the sum of meetings organised scheduled and meetings organised adhoc, you get a number that matches (or very close to) the TWA Performance metric for total meetings organised. This does not equal the meetings organised column (we believe a MSFT bug).

#### Meetings Participated

If you sum this column, you get a number different to the meetings participated number from the headlines above. We believe this is mainly because the headline figure is a unique count of meetings participated, whereas the per user report is a count of per user meeting join.
However, this number still does not add up what we believe is the total number of meetings participated (scheduled + adhoc). Therefore, it is not known what this number actually represents. It does not match TWA Performance. Please see below for "Meetings Organised Scheduled + Meetings Organised Adhoc" for what we believe is the true meetings organised count.

#### Meetings Participated Scheduled

If you sum this column, we can only assume this is the number of per user scheduled meetings participated. TWA Performance does not collect this metric.

#### Meetings Participated Adhoc

If you sum this column, we can only assume this is the number of per user adhoc meetings participated. TWA Performance does not collect this metric.

#### Meetings Participated Scheduled + Meetings Participated Adhoc

If you sum the sum of meetings participated scheduled and meetings participated adhoc, you get a number that matches (or very close to) the TWA Performance metric. This does not equal the meetings participated column (we believe a MSFT bug).

#### 1:1 calls

If you sum this column, you get a number different to the 1:1 number from the headlines above. We believe this is mainly because the headline figure is a unique count of 1:1 calls, whereas the per user report is a count of per user 1:1 call participation. It is not exactly double, because some 1:1 calls are with external users, the CSV download "mostly" does not contain external users or phone numbers. It matches a TWA Performance metric.

#### Audio Time

if you sum this column, you get a number different to the Audio time number from the headline above. We do not know why this is. It matches a TWA Performance metric.

#### Video Time

if you sum this column, you get a number different to the Video time number from the headline above. We do not know why this is. It matches a TWA Performance metric.

#### Screen Share Time

if you sum this column, you get a number different to the Video time number from the headline above. We do not know why this is. It matches a TWA Performance metric.
