## Relative User Activity Average

The Relative User Activtiy average reports show how the average usage changes for users in each of the [Relative User Activity thresholds](../../../RUA-Thresholds.md) . The reports show the data per modality, and over a daily weekly or monthly time period.

The intent of the report is to give you an indication of how the thresholds change over time. For example, you should be able to see the usage of your medium activity users increase based on user adoption initiatives.

### Worked Example

Consider the following table of classifications / usage for Team Messages for a single day;

| User | Department | Team Messages | Classification |
|---|---|---:|---|
| Adam Barr | Sales | 1 | Low |
| Dan Park | Sales | 1 | Low |
| Frank Martinez | Sales | 2 | Medium |
| Diane Tibbot | Sales | 3 | Medium |
| Christine Koch | Development | 6 | Medium |
| Jeff Hay | Sales | 7 | Medium |
| Alan Steiner | Development | 8 | High |
| Dan Jump | Development | 14 | High |
| Karim Manar | Sales | 16 | High |
| Chris Norred | Development | 22 | Very High |

Without any filters applied, the chart would show four data points which are averages for each classification as follows;

| Classification | Average | Calculation |
|---|---:|---:|
| Low | 1 | (1+1) / 2 |
| Medium | 4.5 | (2+3+6+7) / 4 |
| High | 12.667 | (8+14+16) / 3 |
| Very High | 22 | (22) / 1 |

### Worked Example with filters

If a filter is applied on the Department column to exclude the "Sales" department, this would leave us with the following source data;

| User | Department | Team Messages | Classification |
|---|---|---:|---|
| Christine Koch | Development | 6 | Medium |
| Alan Steiner | Development | 8 | High |
| Dan Jump | Development | 14 | High |
| Chris Norred | Development | 22 | Very High |

This would result in a chart with only 3 data points for that day (because there are no "Low Activity" users in the Development department), these are as follows;

| Classification | Average | Calculation |
|---|---:|---:|
| Medium | 6 | (6) / 1 |
| High | 11 | (8+14) / 2 |
| Very High | 22 | (22) / 1 |

This chart would now give an indication of average use per classification for a single department.