Connect-ExchangeOnline

$email = "user@company.com"

$folderId = (Get-MailboxFolderStatistics -Identity $email -FolderScope Inbox -ErrorAction Stop |
    Where-Object FolderType -eq 'Inbox').FolderId

[bool](Get-MailboxFolderPermission -Identity "${email}:$folderId" -ErrorAction Stop |
    Where-Object { $_.User.UserType -in 0,1 -and ($_.AccessRights -join ',') -ne 'None' })
