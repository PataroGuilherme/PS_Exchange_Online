
# To Connect Exchange Online
Connect-ExchangeOnline

# Domains
$dominios = @("domain.com", "domain2.com")

	
# Create rule to romove External Tag from some domains
New-TransportRule -Name "RULE_NAME" `
-SenderDomainIs $dominios `
-SetHeaderName "X-MS-Exchange-Organization-SkipSafeLinksProcessing" -SetHeaderValue "true"

Disconnect-ExchangeOnline
