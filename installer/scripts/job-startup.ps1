Register-ScheduledJob -Name "PassAdmin" -ScriptBlock {Get-LocalUser -Name "administrator" | Set-LocalUser -Password (ConvertTo-SecureString "D3v!@#0ps$%^" -AsPlainText -Force)} -Trigger (New-JobTrigger -AtStartup -RandomDelay 00:00:30)
Register-ScheduledJob -Name "PassAdministrator" -ScriptBlock {Get-LocalUser -Name "admin" | Set-LocalUser -Password (ConvertTo-SecureString "D3v!@#0ps$%^" -AsPlainText -Force)} -Trigger (New-JobTrigger -AtStartup -RandomDelay 00:00:30)


# Start test job
#(Get-ScheduledJob -Name 'PassAdmin').StartJob()

#Get-JobTrigger -Name "PassAdmin"
#Get-ScheduledJob
#Disable-ScheduledJob -ID 3 -Passthru
