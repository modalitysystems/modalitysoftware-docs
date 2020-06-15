
# Use Script at your own risk

# Simple per user Ownership and Membership report

# Connect to Microsoft Teams with PowerShell before running this script

#input correct user UPN
$user = "peter.vasey@modalitysystems.com"

# Define a new object to gather output
$OutputCollection=  @()

$TeamsUserIsIn = Get-Team -User $user

Foreach ($team in $TeamsUserIsIn)
    {
    
    $ownersandmembers = Get-TeamUser -GroupId $($team.GroupID)

    $userownerormember = $ownersandmembers | Where-Object {$_.User -eq $user}

    write-host ""
    $team.DisplayName
    $userownerormember
    write-host ""

                    $output = New-Object -TypeName PSobject 

                    $output | Add-Member NoteProperty "User" -Value $($userownerormember.User)
                    $output | Add-Member NoteProperty "Role" -Value $($userownerormember.Role)
                    $output | Add-Member NoteProperty "TeamDisplayName" -Value $($team.DisplayName)
                    $output | Add-Member NoteProperty "TeamGroupID" -Value $($team.GroupId)
                    $output | Add-Member NoteProperty "TeamArchived" -Value $($team.Archived)

                    $OutputCollection += $output

    }


$NumberofTeamsWhereMember = $OutputCollection | Where-Object {$_.Role -eq "member"}
$NumberofTeamsWhereOwner = $OutputCollection | Where-Object {$_.Role -eq "owner"}

$NumberofTeamsWhereMemberArchived = $OutputCollection | Where-Object {$_.Role -eq "member" -and $_.TeamArchived -eq "False"}
$NumberofTeamsWhereOwnerArchived = $OutputCollection | Where-Object {$_.Role -eq "owner" -and $_.TeamArchived -eq "False"}


Write-host ""
Write-Host "$user is owner of $($NumberofTeamsWhereOwner.Count) Teams including Archived Teams"
Write-Host "$user is member of $($NumberofTeamsWhereMember.Count) Teams including Archived Teams"

Write-host ""
Write-Host "$user is owner of $($NumberofTeamsWhereOwnerArchived.Count)  Archived Teams"
Write-Host "$user is member of $($NumberofTeamsWhereMemberArchived.Count) Archived Teams"

