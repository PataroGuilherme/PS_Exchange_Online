Connect-ExchangeOnline

Power Shell code to apply:
" Set-MailboxJunkEmailConfiguration -Identity user@email.com -TrustedSendersAndDomains @{Add="contact@email.com"} "

Power Shell code to confirm:
" Get-MailboxJunkEmailConfiguration -Identity user@email.com "


# Lista de usuários
$usuarios = @(
    "user1@email.com",
    "user2@email.com",
    "user3@email.com"
)

# Endereço de e-mail confiável que será adicionado
$trustedSender = "contact@email.com"

# Loop para aplicar a configuração a todos os usuários
foreach ($usuario in $usuarios) {
    Set-MailboxJunkEmailConfiguration -Identity $usuario -TrustedSendersAndDomains @{Add=$trustedSender}
    Write-Host "Adicionado $trustedSender como remetente confiável para $usuario"
}
