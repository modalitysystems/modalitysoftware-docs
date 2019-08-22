## Welcome

The Teamwork Analytics Technical Documentation page provides access to all of the platform documentation you will need to successfully setup and configure Teamwork Analytics.

## Deployment Prerequisites

You will need:

- access to a Microsoft Azure tenant
- an Azure Global Admin account (for admin consent of application permissions)
- to create a PowerBI Pro service user and provide us with login credentials

## How to Deploy:

### Step 1: Register an Azure Application

Start by registering a new Azure Application in your Azure tenant. For this step you will need to use an Azure Global Admin account. 

[Registering Teamwork Analytics as an Azure Application](registerapplication.md)

Once the application has been registered, submit the Application ID of your newly created application to Modality System for it to be whitelisted. Once this is has happened you will be given access to continue the deployment using the steps below.

### Step 2: Deploy Teamwork Analytics

Teamwork Analytics uses an Azure Resource Management (ARM) template to ease deployment. The ARM template ensures that all data is held on your Azure tenant, and is a simple way to deploy and secure several resources on your Azure tenant. Using the information provided to you from the previous step, follow the [deployment steps here](deploytwa.md).

One the deployment has completed, review the resources which have been created within the resource group. One of the resources is a SQL Server with a name similar to *twa-aaa1bb2c3dd4e*. Make a note of this name.

Once you have completed this step you should provide Modality System with the following information:

- credentials of the PowerBI Pro service user
- the name of the SQL Server that was created
- the SQL Admin username and password used in the deployment process 

### Step 3: Temporarily Allow Access

Once we have received the information above we will ask you to perform this step, which temporarily allows us access to configure final settings. 

From the Azure Portal, navigate to the SQL Server. From the **Security** pane, choose **Firewalls and Virtual Networks**. Add a new rule with the following information:

- Rule Name: ModalityTemp
- Start IP: 62.255.97.36
- End IP: 62.255.97.36

Be sure to remove this rule once we have notified you that setup is complete.

---

There are some optional setup steps required for additional modules. Do not follow these steps unless you have been advised to by Modality Systems as they will not work if not enabled on your account, and may cause other parts of TWA to stop working.


## [Deploy TWA Bot](twabot.md)

Requirements and instructions for optionally deploying TWA Bot.
