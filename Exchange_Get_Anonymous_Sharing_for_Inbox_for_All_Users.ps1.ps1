<#
.SYNOPSIS
    Reports user mailboxes (shared mailboxes excluded) that share their Inbox
    or delegate the mailbox to anyone.

.PARAMETER Test
    Limits the scan to the first 50 mailboxes.

.EXAMPLE
    .\Get-MailboxSharingReport.ps1 -Test
    .\Get-MailboxSharingReport.ps1
#>

param([switch]$Test)

$ErrorActionPreference = 'Stop'

# Connect to Exchange Online only if there is no active session
if (-not (Get-ConnectionInformation -ErrorAction SilentlyContinue | Where-Object { $_.State -eq 'Connected' })) {
    Write-Host "Connecting to Exchange Online..." -ForegroundColor Cyan
    Connect-ExchangeOnline -ShowBanner:$false
}

$limit = if ($Test) { 50 } else { 'Unlimited' }

Write-Host "Listing user mailboxes..." -ForegroundColor Cyan
$mailboxes = @(Get-EXOMailbox -RecipientTypeDetails UserMailbox -ResultSize $limit `
    -Properties GrantSendOnBehalfTo, UserPrincipalName)

$total  = $mailboxes.Count
$report = [System.Collections.Generic.List[object]]::new()
$errors = [System.Collections.Generic.List[object]]::new()
$i      = 0
$sw     = [System.Diagnostics.Stopwatch]::StartNew()

foreach ($m in $mailboxes) {
    $i++
    $upn = $m.UserPrincipalName
    try {
        # --- Inbox sharing (any entry with rights other than None) ---
        $inbox = [System.Collections.Generic.List[string]]::new()
        $folderId = (Get-EXOMailboxFolderStatistics -Identity $upn -FolderScope Inbox |
            Where-Object FolderType -eq 'Inbox').FolderId
        if (-not $folderId) { throw "Inbox folder not found" }

        foreach ($p in Get-EXOMailboxFolderPermission -Identity "${upn}:$folderId") {
            $rights = $p.AccessRights -join ','
            if ($rights -ne 'None') {
                $who = if ($p.User.DisplayName) { $p.User.DisplayName } else { "$($p.User)" }
                $inbox.Add("$who ($rights)")
            }
        }

        # --- Delegates: Full Access, Send As, Send on Behalf ---
        $deleg = [System.Collections.Generic.List[string]]::new()

        foreach ($p in Get-EXOMailboxPermission -Identity $upn) {
            if (-not $p.IsInherited -and -not $p.Deny -and "$($p.User)" -ne 'NT AUTHORITY\SELF') {
                $deleg.Add("$($p.User) (FullAccess)")
            }
        }
        foreach ($p in Get-EXORecipientPermission -Identity $upn) {
            if ("$($p.Trustee)" -ne 'NT AUTHORITY\SELF') { $deleg.Add("$($p.Trustee) (SendAs)") }
        }
        foreach ($d in $m.GrantSendOnBehalfTo) { $deleg.Add("$d (SendOnBehalf)") }

        if ($inbox.Count -or $deleg.Count) {
            $report.Add([pscustomobject]@{
                Mailbox   = $upn
                Inbox     = $inbox -join '; '
                Delegates = $deleg -join '; '
            })
        }

        Write-Host ("[{0}/{1}] {2} | Inbox shared: {3} | Delegates: {4}" -f `
            $i, $total, $upn, [bool]$inbox.Count, [bool]$deleg.Count) `
            -ForegroundColor $(if ($inbox.Count -or $deleg.Count) { 'Yellow' } else { 'Gray' })
    }
    catch {
        $errors.Add([pscustomobject]@{ Mailbox = $upn; Error = $_.Exception.Message })
        Write-Host ("[{0}/{1}] {2} | ERROR: {3}" -f $i, $total, $upn, $_.Exception.Message) -ForegroundColor Red
    }
}
$sw.Stop()

# --- Final report ---
Write-Host "`n=========== SHARING REPORT ===========" -ForegroundColor Cyan
if ($report.Count) { $report | Format-Table Mailbox, Inbox, Delegates -AutoSize -Wrap }
else { Write-Host "No mailboxes with sharing found." }

Write-Host "`n----------- SUMMARY -----------" -ForegroundColor Cyan
"Mailboxes scanned        : $total"
"Sharing anything         : $($report.Count)"
"Inbox shared             : $(@($report | Where-Object Inbox).Count)"
"Delegates configured     : $(@($report | Where-Object Delegates).Count)"
"Errors (not evaluated)   : $($errors.Count)"
"Elapsed                  : $($sw.Elapsed.ToString('hh\:mm\:ss'))"

if ($errors.Count) { Write-Host "`n--- ERRORS ---" -ForegroundColor Red; $errors | Format-Table -AutoSize -Wrap }

$csv = Join-Path (Get-Location) ("MailboxSharingReport_{0:yyyyMMdd_HHmmss}.csv" -f (Get-Date))
$report | Export-Csv $csv -NoTypeInformation -Encoding UTF8
Write-Host "`nCSV saved to: $csv" -ForegroundColor Green
