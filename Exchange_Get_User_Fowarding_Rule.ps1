Connect-ExchangeOnline

# Mailbox
$mailboxUPN = "email@company.com"

$mailbox = Get-Mailbox $mailboxUPN | Select-Object DisplayName,ForwardingAddress,ForwardingSmtpAddress,DeliverToMailboxAndForward

$mailbox | Format-List
