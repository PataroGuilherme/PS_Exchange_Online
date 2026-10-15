# Connect to Exchange Online
Connect-ExchangeOnline

# Name or address of the Distribution List
$distributionList = "groupname@yourdomain.com"

# List of email addresses to be added
$users = @(
    "user1@yourdomain.com",
    "user2@yourdomain.com",
    "user3@yourdomain.com"
)

# Adding users to the Distribution List
foreach ($user in $users) {
    try {
        Add-DistributionGroupMember -Identity $distributionList -Member $user
        Write-Host "✅ $user successfully added to the list $distributionList" -ForegroundColor Green
    }
    catch {
        Write-Host "❌ Failed to add $user : $_" -ForegroundColor Red
    }
}

# Disconnect from Exchange Online
Disconnect-ExchangeOnline
