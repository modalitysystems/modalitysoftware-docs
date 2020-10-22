# Install and configure the satellite monitor on Microsoft Teams Room

 

**Install and configure the satellite**

 On the Microsoft Teams Room, boot into the Windows desktop, either locally or remotely.

1. Download the latest PA Server Monitor installer from https://www.poweradmin.com/servermonitor/servermonitorultra.exe

2. Launch the installer.

3. Accept the licence agreement.

4. Install to the default location.

5. Select the 'Satellite Monitoring Service' checkbox. Deselect all others.
6. Deselect the installation of the SQL Server Native Client.
7. Complete installation.
8. Launch the 'Configure Satellite Monitoring Service' program.
9. Enter Central Monitoring Service address: **monitoring.modalitysystems.com:443** (Note: server requires internet access). Test the connection to verify connectivity. Or if using a dedicated PA Server install, point to your PA server monitor address.
10. Enter the company name as the 'Satellite description'. (Ignore setting the PA Satellite Service account as this is not needed in this configuration)
11. Select 'Apply Settings'.