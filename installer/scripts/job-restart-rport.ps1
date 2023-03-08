Register-ScheduledJob -Name "RestartRport" -ScriptBlock {Restart-Service rport} -Trigger (New-JobTrigger -Daily -At "8:30")
Get-ScheduledJob -Name 'RestartRport' | Add-JobTrigger -Trigger (New-JobTrigger -Daily -At "9:30")
Get-ScheduledJob -Name 'RestartRport' | Add-JobTrigger -Trigger (New-JobTrigger -Daily -At "10:30")
Get-ScheduledJob -Name 'RestartRport' | Add-JobTrigger -Trigger (New-JobTrigger -Daily -At "11:30")
Get-ScheduledJob -Name 'RestartRport' | Add-JobTrigger -Trigger (New-JobTrigger -Daily -At "12:30")
Get-ScheduledJob -Name 'RestartRport' | Add-JobTrigger -Trigger (New-JobTrigger -Daily -At "13:30")
Get-ScheduledJob -Name 'RestartRport' | Add-JobTrigger -Trigger (New-JobTrigger -Daily -At "14:30")
Get-ScheduledJob -Name 'RestartRport' | Add-JobTrigger -Trigger (New-JobTrigger -Daily -At "15:30")
Get-ScheduledJob -Name 'RestartRport' | Add-JobTrigger -Trigger (New-JobTrigger -Daily -At "16:30")

# Start test job
#(Get-ScheduledJob -Name 'TestJob').StartJob()

#Get-JobTrigger -Name "BackupJob"
#Get-ScheduledJob
#Disable-ScheduledJob -ID 3 -Passthru

# $trigger = New-JobTrigger -AtStartup -RandomDelay 00:00:30
