# Conecte-se ao Exchange Online se ainda não estiver conectado
Connect-ExchangeOnline

# Nome da lista de distribuição dinâmica
$dynamicDL = "NomeDaListaDinamica"

# Lista de usuários permitidos a enviar e-mails (substitua pelos UPNs ou aliases corretos)
$autorizados = @(
"user1@domain.com"
)

# Atribui os usuários à propriedade AcceptMessagesOnlyFrom
Set-DynamicDistributionGroup -Identity $dynamicDL -AcceptMessagesOnlyFrom $autorizados

# Consulta o grupo e exibe quem está autorizado a enviar mensagens
(Get-DynamicDistributionGroup -Identity $dynamicDL).AcceptMessagesOnlyFrom | Get-Recipient | Select Name, PrimarySmtpAddress

