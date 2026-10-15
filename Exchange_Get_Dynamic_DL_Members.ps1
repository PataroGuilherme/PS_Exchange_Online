Connect-ExchangeOnline

$ddlName = "List_Name"

#DDL Filters
$ddl = Get-DynamicDistributionGroup -Identity $ddlName

#Show filters
Write-Host "Filtro: $($ddl.RecipientFilter)" -ForegroundColor Cyan

#Users using the filter
$usuarios = Get-Recipient -RecipientPreviewFilter $ddl.RecipientFilter -OrganizationalUnit $ddl.RecipientContainer

# Final result
$usuarios | Select-Object Name, PrimarySmtpAddress


$usuarios | Select-Object Name, PrimarySmtpAddress | Export-Csv -Path "users_DDL.csv" -NoTypeInformation -Encoding UTF8
