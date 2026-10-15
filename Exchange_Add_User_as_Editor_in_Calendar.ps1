Connect-ExchangeOnline

Add-MailboxFolderPermission `
-Identity "CalendarOwner@domain.com:\Calendar" `
-User "UserToBeAddedAsEditor@pdomain.com" `
-AccessRights Editor
