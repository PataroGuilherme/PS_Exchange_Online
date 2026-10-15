Add-MailboxPermission `
    -Identity "UserOwner@pdomain.com" `
    -User "userToBeAdded@domain.com" `
    -AccessRights FullAccess `
    -InheritanceType All `
    -AutoMapping $true
