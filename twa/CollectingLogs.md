
# Collecting Teamwork Analytics Logs

If you have issues with Teamwork Analytics, Modality Systems may ask you to collect logs for us to analyse the issue.

There are two sets of logs we require, both from the collector Azure virtual machine.

## 1. Windows Event Logs

We recommend keeping 30 days of windows event logs on the collector virtual machine.

Please collect all Application and System event logs for the collector Azure virtual machine

Steps
  1. Run Event Viewer
  2. Expand Windows Logs folder on the right
  3. Right click on Application Event Log in the Widows Logs folder
  4. "Save All Events As" and save as "Application Event log <CustomerName> <date>.evtx"
  6. Right click on System Event Log in the Widows Logs folder
  7. "Save All Events As" and save as "System Event log <CustomerName> <date>.evtx"
  
 ## 2. Teamwork Analytics Graph Collector Application Text Logs

On the Azure Collector Virtual Machine

Steps
  1. Please ZIP the folder C:\Program Files\Modality\GraphETL\Logs (or the folder you installed Teamwork Analytics to if you chose a custom folder)
  2. Save the Zip as "TWA Logs <CustomerName> <Date>.zip
  
  End
  
 > Note: This directory can contain up to 10GB of text logs so it may be necessary to use a file sharing service, such as SharePoint, to share the zip file with Modality.
  
 ## 3. Screenshot of Windows Tasks Manager Processes and Performance tabs (for current RAM/CPU state)
  
 This is just for the current state of processes, CPU and Memory usage.
  
 Please email over or link to all files for Modality Systems to review
 
 
 
