# Defina as Listas de Distribuição que deseja consultar
$DistributionLists = @(
"DL_NAME@domain.com"
)

# Conectar ao Exchange Online
Connect-ExchangeOnline

# Criar uma lista para armazenar os resultados
$allMembers = @()

# Percorrer cada Lista de Distribuição
foreach ($DistributionList in $DistributionLists) {
    $members = Get-DistributionGroupMember -Identity $DistributionList | Select-Object Name, PrimarySmtpAddress, @{Name='DistributionList';Expression={$DistributionList}}
    $allMembers += $members
}

# Exportar para um arquivo CSV
$allMembers | Export-Csv -Path "Membros_DL.csv" -NoTypeInformation -Encoding UTF8


# Exibir os membros no console
$allMembers | Format-Table -AutoSize

# Desconectar do Exchange Online
Disconnect-ExchangeOnline -Confirm:$false
