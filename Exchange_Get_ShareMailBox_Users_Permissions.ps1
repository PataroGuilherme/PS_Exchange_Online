Connect-ExchangeOnline

# List of shared mailboxes
$sharedMailboxes = @(
    "email1@domain.com",
    "email2@domain.com"
)

# Create a list to store the results
$results = @()

# Loop through each shared mailbox
foreach ($sharedMailbox in $sharedMailboxes) {
    Write-Host "Checking permissions for: $sharedMailbox" -ForegroundColor Cyan

    # Get permissions for the shared mailbox
    $permissions = Get-MailboxPermission -Identity $sharedMailbox | Where-Object { $_.User -notmatch "NT AUTHORITY\\SELF" }

    # Process each permission entry
    foreach ($perm in $permissions) {
        $results += [PSCustomObject]@{
            SharedMailbox      = $sharedMailbox
            User               = $perm.User
            Permission         = $perm.AccessRights -join ", "
        }
    }
}

# Display the results in the console
$results | Format-Table -AutoSize

# Export the results to a CSV file
$csvPath = "SharedMailboxPermissions.csv"
$results | Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

Write-Host "Report generated: $csvPath" -ForegroundColor Green

Disconnect-ExchangeOnline
