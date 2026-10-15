Connect-ExchangeOnline

New-SharingPolicy -Name "NoSharingCalendars" -Domains "domain.com: CalendarSharingFreeBusySimple"

## Change the user:
Set-Mailbox -Identity user1@domain.com -SharingPolicy "NoSharingCalendars"

## Check the user:
Get-Mailbox -Identity user1@domain.com | Format-List SharingPolicy
