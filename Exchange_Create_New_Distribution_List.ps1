# Import Exchange Online module
Import-Module ExchangeOnlineManagement

# Connect to Exchange Online (descomentar si necesario)
Connect-ExchangeOnline

#region Parameters
$DisplayName = "DL_NAME"
$Description = "DL Description"
$Alias = "DL_ALIAS"
$EmailAddress = "DL_MAIL@pdomain.com"
$Recipients_Users = @(
    "user1@domain.com"
)
$Recipients_DL_SharedMailboxes = ""
$Senders_Users = ""
$Senders_Groups = ""
$Owner = "user1@domain.com"
$BackupOwner = "user2@domain.com"
$AllowExternalUsers = $false
#endregion

# Create Distribution Group
New-DistributionGroup `
  -Name $DisplayName `
  -Notes $Description `
  -Alias $Alias `
  -PrimarySmtpAddress $EmailAddress `
  -DisplayName $DisplayName `
  -Type "Distribution" `
  -Members $Recipients_Users

# Asignar Owner y BackupOwner después de crearlo
Set-DistributionGroup -Identity $DisplayName -ManagedBy @($Owner, $BackupOwner)

# Disconnect session (optional)
# Disconnect-ExchangeOnline -Confirm:$false
