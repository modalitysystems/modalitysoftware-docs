

# Use script at your own risk

# Define a new object to gather output
$OutputCollection=  @()

Write-Verbose "Getting Team Names and Details"
$teams = Get-Team 

$Archived = $teams | Where Archived -Match True

$NonArchived = $teams | Where Archived -Match False

write-host ""
Write-Host "Total Teams count is $($teams.Count)"
Write-Host ""
Write-host "Archieved Teams count is $($Archived.Count)"
write-host ""
Write-Host "Non Archived Teams count is $($NonArchived.Count)"
write-host ""
Write-Host "Private Teams count is $($NonArchived.Count)"
write-host ""      
Write-Host "Public Teams count is $($NonArchived.Count)"
write-host ""   
Write-Host "Private HiddenMembership Teams count is $($NonArchived.Count)"
write-host ""                    

$teams | ForEach-Object {

    Write-host "Getting details for Team $($_.DisplayName)"

    # Calculate Description word count
                    
    $DescriptionWordCount = $null
    $DescriptionWordCount = ($_.Description | Out-String | Measure-Object -Word).words

    #Get channel details

    $Channels = $null
    $Channels = Get-TeamChannel -GroupId $_.GroupID
    $ChannelCount = $Channels.count

    # Get Owners, members and guests

    $TeamUsers = Get-TeamUser -GroupId $_.GroupID
                    
    $TeamOwnerCount = ($TeamUsers | Where-Object {$_.Role -like "owner"}).count
    $TeamMemberCount = ($TeamUsers | Where-Object {$_.Role -like "member"}).count
    $TeamGuestCount = ($TeamUsers | Where-Object {$_.Role -like "guest"}).count

    # Put all details into an object

    $output = New-Object -TypeName PSobject 

    $output | add-member NoteProperty "DisplayName" -value $_.DisplayName
    $output | add-member NoteProperty "Description" -value $_.Description
    $output | add-member NoteProperty "DescriptionWordCount" -value $DescriptionWordCount
    $output | add-member NoteProperty "Visibility" -value $_.Visibility
    $output | add-member NoteProperty "Archived" -value $_.Archived
    $output | Add-Member NoteProperty "ChannelCount" -Value $ChannelCount
    $output | Add-Member NoteProperty "OwnerCount" -Value $TeamOwnerCount
    $output | Add-Member NoteProperty "MemberCount" -Value $TeamMemberCount
    $output | Add-Member NoteProperty "GuestCount" -Value $TeamGuestCount
    $output | add-member NoteProperty "GroupId" -value $_.GroupId

    $OutputCollection += $output
    }

    # Output collection
    $OutputCollection