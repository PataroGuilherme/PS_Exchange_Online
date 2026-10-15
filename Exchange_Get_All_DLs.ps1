# Conecta ao Exchange Online
Connect-ExchangeOnline

# Coleta todas as listas de distribuição
$distLists = Get-DistributionGroup -ResultSize Unlimited

# Exibe as listas na tela
$distLists | Select-Object DisplayName, PrimarySmtpAddress, ManagedBy

# Exporta os dados para CSV
$csvPath = "ListasDistribuicao.csv"
$distLists | Select-Object DisplayName, PrimarySmtpAddress, ManagedBy |
    Export-Csv -Path $csvPath -NoTypeInformation -Encoding UTF8

Write-Host "`nExportação concluída: $csvPath"

# Desconecta do Exchange Online
Disconnect-ExchangeOnline -Confirm:$false
