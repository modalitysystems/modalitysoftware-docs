

Note that SOW30 / Teamwork Analytics Performance stores data in 2 ways:

 1. RAW - this is the unprocessed JSON from the Call Records API
 2. Aggregate - this is data collected and calculated from the RAW stream data by Modality. Note that not all information is aggregated

Modality Teamwork Analytics Performance can report from both RAW and Aggregate. There is a limited store of RAW information as it is large to store and computationally expensive/slow to report from.


Meeting - 

Call - 

Join Types:

 - PSTN Dial in - Dialled into the meeting on PSTN
 - PSTN Dial out - the meeting dialled out to the PSTN user (either a user chose to have the meeting dial them, or they asked for the meeting to dial them
 - IP Join - Joined via "Internet Protocol" e.g. an IP network connection, could be mobile client, desktop or browser

Meeting Join - The event of joining a meeting, either via IP or PSTN. Note a single user, Alice, can join and leave and join a single meeting multiple times and can also simultaneously join from multiple devices e.g. joins on desktop but then joins on mobile to use the mobile camera into the meeting

External Meeting Join - A user who joined via IP who is not part of the tenant who hosted the meeting. This does not include PSTN users. The data does not allow defining if a PSTN joiner is a member of the tenant or not.
