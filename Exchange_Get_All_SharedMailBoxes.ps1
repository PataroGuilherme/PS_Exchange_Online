# Importa o módulo do Exchange Online
Import-Module ExchangeOnlineManagement

# Conecta ao Exchange Online (será solicitado o login)
Connect-ExchangeOnline

# Recupera todas as caixas de correio do tipo "Shared"
$sharedMailboxes = Get-Mailbox -RecipientTypeDetails SharedMailbox -ResultSize Unlimited

# Exibe apenas os endereços de e-mail principais (PrimarySmtpAddress)
$sharedMailboxes | Select-Object Name, PrimarySmtpAddress | Format-Table -AutoSize

# Opcional: exportar a lista para um CSV
$sharedMailboxes | Select-Object Name, PrimarySmtpAddress | Export-Csv -Path "SharedMailboxes.csv" -NoTypeInformation -Encoding UTF8

# Desconectar da sessão do Exchange Online
Disconnect-ExchangeOnline -Confirm:$false
