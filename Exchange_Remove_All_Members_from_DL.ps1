Connect-ExchangeOnline

$DL = "DL_MAIL@domain.com"

# Obter todos os membros da DL
$members = Get-DistributionGroupMember -Identity $DL

# Remover cada membro
foreach ($member in $members) {
    Remove-DistributionGroupMember -Identity $DL -Member $member.PrimarySmtpAddress -Confirm:$false
}

Write-Host "Todos os membros foram removidos da DL $DL"
