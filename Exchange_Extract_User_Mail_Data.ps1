
Connect-MgGraph -Scopes "User.Read.All"

Connect-ExchangeOnline

# === Defina aqui o array de e-mails ===
$emails = @(
    "email@domain.com"
)

$resultados = @()

foreach ($email in $emails) {
    try {
        $user = Get-MgUser -Filter "userPrincipalName eq '$email'" -Property GivenName,Surname,DisplayName,Country,Department,City,CompanyName,OfficeLocation -ErrorAction Stop

        $obj = [PSCustomObject]@{
            Name        = $user.GivenName
            Surname     = $user.Surname
            Region      = $user.OfficeLocation  # Ou City, se preferir
            Country     = $user.Country
            Department  = $user.Department
            Team        = $user.CompanyName     # Ou outro atributo personalizado
        }

        $resultados += $obj
    }
    catch {
        Write-Warning "Usuário não encontrado: $email"
    }
}

# View in tabular form
$resultados | Format-Table -AutoSize | Clip
