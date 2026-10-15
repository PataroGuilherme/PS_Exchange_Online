# Defina o endereço da Shared Mailbox
$SharedMailbox = "SharedMailBox@domain.com"

# Array com os membros que devem ser adicionados
$Members = @(
"user1@domain.com"
)

# Conectar ao Exchange Online
Connect-ExchangeOnline -UserPrincipalName admin@seudominio.com

# Adicionar os membros à Shared Mailbox
foreach ($Member in $Members) {
    try {
        Add-MailboxPermission -Identity $SharedMailbox -User $Member -AccessRights FullAccess -InheritanceType All -ErrorAction Stop
        Add-RecipientPermission -Identity $SharedMailbox -Trustee $Member -AccessRights SendAs -Confirm:$false -ErrorAction Stop
        Write-Host "Permissões atribuídas com sucesso a $Member"
    } catch {
        Write-Host "Erro ao adicionar $Member : $_"
    }
}

# Desconectar
Disconnect-ExchangeOnline
