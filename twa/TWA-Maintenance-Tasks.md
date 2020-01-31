# Azure Windows Virtual Machine

- Ensure VM is running 24x7
- VM Resources - We recommend no resource reduction to be made on VM from initial deployment. If reduction is made, please review PowerBI Apps/Reports to ensure data is still process as expected.
- Network and/or Security Group changes - If any changes are made, please review PowerBI Apps/Reports to ensure data is still process as expected.
- VM Backup - There is no need to backup this machine

# Azure SQL

- Backup the database to your usual schedule. At least weekly is recommended.
	
# Windows OS

- Modality Service - This service should always be running. If not running attempt Restart. If unable to start, please raise with Modality. Please provide local logs (Location - C:\Program Files\Modality\Graph.ETL\Logs)
- Disk Space Monitor - Please ensure minimum 10% disk space is available. 
- Bot Scheduled Tasks - Scheduled tasks are deployed to manage Bot notifications. If disabled, Bot functionality will stop. Please review with Service Owner before enabling or disabling tasks
	
# Power BI

- App refresh failures to be reviewed
- On 1st failure, manually refresh dataset
- On 2nd failure, Issue to be raised with Modality - Refresh history and error to be provided to Modality
	
# PowerBI App Update

- Follow guidance located here (link to docs site)
- Note: SQL Database Username/Password will be required during updated.
