# governance Reporter

## <a name="#columns"></a>Columns

| Name | Data Type | Max Length (Bytes) | Description |
|---|---|---|---|
| TeamId | uniqueidentifier | 16 |
| DisplayName | nvarchar(max) | max |
| Visibility | nvarchar(max) | max |
| IsArchived | bit | 1 |
| CreatedDateTime | datetime2 | 8 |
| DupedDisplayNamesCount | int | 4 |
| HasActiveChannels | bit | 1 |
| OwnerCount | int | 4 |
| MemberCount | int | 4 |
| GuestCount | int | 4 |
| ChannelCount | int | 4 |
| IsDisplayNameDupe | bit | 1 |
| HasDescription | bit | 1 |
| HasMultipleChannels | bit | 1 |
| HasOwners | bit | 1 |
| HasMultipleOwners | bit | 1 |
| HasMembers | bit | 1 |
| HasMultipleMembers | bit | 1 |
| HasGuests | bit | 1 |

