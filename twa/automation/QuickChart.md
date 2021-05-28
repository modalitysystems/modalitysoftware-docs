Using QuickChart
==========

QuickChart is an API for programmatically rendering charts and graphs. This allows us to embed charts in our Teamwork Automation messages. To make a chart all you need to do to consume it is construct a url that looks like the following:

`https://quickchart.io/chart?c={type:'bar',data:{labels:['Q1','Q2','Q3','Q4'], datasets:[{label:'Users',data:[50,60,70,180]},{label:'Revenue',data:[100,200,300,400]}]}}`

Which yields the following image:

![](https://quickchart.io/chart?c=%7Btype:'bar',data:%7Blabels:%5B'Q1','Q2','Q3','Q4'%5D,%20datasets:%5B%7Blabel:'Users',data:%5B50,60,70,180%5D%7D,%7Blabel:'Revenue',data:%5B100,200,300,400%5D%7D%5D%7D%7D)

Adding to Teamwork Automation
-----------------------------

To add a QuickChart to a Teamwork Automation template, simply paste the URL into an image element, e.g.:

`{
	"type": "Image",
	"url": "https://quickchart.io/chart?c={type:'bar',data:{labels:['Q1'], datasets:[{label:'Users',data:[50]}]}}",
	"size": "large"
}`

This can be tested in the [Adaptive Card Designer](https://adaptivecards.io/designer/).

To use data from the TWA notification service, simply paste the variables into the URL e.g.:

Variable: `${RowsWithAdditionalProperties[0].Value.MeetingsVsCallsPercentage}`

Variable inside a URL: `https://quickchart.io/chart?c={type:'bar',data:{labels:['Q1'], datasets:[{label:'Users',data:[${RowsWithAdditionalProperties[0].Value.MeetingsVsCallsPercentage}]}]}}`

Further reading
---------------

At [QuickChart's homepage](https://quickchart.io/) there are interactive editors for constructing URLs, a gallery of examples, and extensive documentation.
