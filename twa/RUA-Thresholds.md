## Relative User Activity Thresholds *

Relative User Activity Thresholds are for grouping users into Low, Medium, High and Very High usage categories

* They are good for​;
    * Comparing departments, groups, countries​
    * What % of their user Low, Medium, High and Very High​

* They enables report such as;
    * “Where are the highest Calls activity users located?” ​
    * “How does London usage compare to France usage for Team Chat?”​

* Category boundaries based on global usage, per modality, for the day/week or month

* Boundaries change as global usage trend changes

* Activity grouped into classifications based on percentiles​

* The usage thresholds for each classification will change over time and for each modality.

* Zero usage users are not included in classifications

### Classification Boundaries

We group users into either Low, Medium, High and Very High usage categories using the following percentiles. 

These percentile classifications are based on Modality System previous experience with actioning usage data to drive improved adoption. ​

| Classification | From Percentile | To Percentile | Description |
|---|---|---|---|
| Low | 0th | <= 10th | Users which need the most training and assistance |
| Medium | > 10th | <= 60th | Users should be encouraged via indirect adoption methods such as posters, emails, self-service training etc.​ |
| High | > 60th | <= 90th | Contains "Teams Champions" and those that can help others achieve |
| Very High | > 90th | <= 100th | Extreme users which may be candidates for good news stories, case studies etc.​ |

Ranges are inclusive of the upper bound, but exclude the lower bound. For example, the Medium range can be read as "greater than the 10th Percentile and less than or equal to the 60th percentile"

### Worked Example of Calculation

Consider the following table of usage for Team Messages;

| User | Team Messages |
|---|---:|
| Adam Barr | 1 |
| Alan Steiner | 8 |
| Chris Norred | 22 |
| Christine Koch | 6 |
| Dan Jump | 14 |
| Dan Park | 1 |
| Diane Tibbot | 3 |
| Frank Martinez | 2 |
| Jeff Hay | 7 |
| Karim Manar | 16 |

Percentiles for usage are calculated using the [PERCENTILE_CONT](https://docs.microsoft.com/en-us/sql/t-sql/functions/percentile-cont-transact-sql) function in SQL, the equivalent in Microsoft Excel is [PERCENTILE.INC](https://support.microsoft.com/en-us/office/percentile-inc-function-680f9539-45eb-410b-9a5e-c1355e5fe2ed). The percentile thresholds from this data are calculated as follows;

| Percentile | Value |
|---|---:|
| 10th | 1 |
| 60th | 7.4 |
| 90th | 16.6 |

This results in the following classification of those users;

| User | Team Messages | Classification |
|---|---:|---|
| Adam Barr | 1 | Low |
| Dan Park | 1 | Low |
| Frank Martinez | 2 | Medium |
| Diane Tibbot | 3 | Medium |
| Christine Koch | 6 | Medium |
| Jeff Hay | 7 | Medium |
| Alan Steiner | 8 | High |
| Dan Jump | 14 | High |
| Karim Manar | 16 | High |
| Chris Norred | 22 | Very High |

