Connect-ExchangeOnline
	
$mailboxes = @(
"user1@domain.com"
)

foreach ($mailbox in $mailboxes) {

    Set-Mailbox $mailbox `
        -ForwardingAddress $null `
        -ForwardingSmtpAddress $null `
        -DeliverToMailboxAndForward $false
		
}
