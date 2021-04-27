# How to make a Logic App Webhook for TWA Automation.

## 1. Create a new Logic App in Azure

a) Nagivgate to the [Azure Portal](portal.azure.com), and once signed in choose Create a resource, and then Logic App (you may need to search for this);


![Logic App Creation](../images/automation/LogicAppCreate1.png)


b) Click the create button and fill in the required fields as in the example below


![Logic App Creation](../images/automation/LogicAppCreate2.png)


After a short wait, your logic app will have been created. Navigate to the resource group and move on to section 2.


## 2. Build the workflow in your Logic App

a) Click the edit button on the Logic App home screen, and in the designer, choose "When a HTTP request is received" as your default trigger;

![Logic App Creation](../images/automation/LogicAppCreate3.png)

b) When the designer opens, make sure you leave "Request Body JSON Schema" blank, as the message from the Adaptive Card is unlikely to be strongly typed and it will cause the webhook to reject any input. Do not change this unless you are 100% sure about the schema of the Json response from your card. 
![Logic App Creation](../images/automation/LogicAppCreate4.png)

c) Hit the save button straight away and a URL will be generated for [configuration in the Automation API by Modality](TWA-Automation-CreateAdaptiveCardTemplate#adding-custom-webhook-urls-to-card-actions). Once you have passed it on. Test out your webhook, and view the result in "Runs history" on the overview page;

![Logic App Creation](../images/automation/LogicAppCreate5.png)

d) Click on one of the runs to see what the data looks like. You should see the webhook input by looking at the "Body" property of the "When a HTTP request is received" operation. Copy the value in this box for step e.

![Logic App Creation](../images/automation/LogicAppCreate6.png)

e) Go back to the designer and add a new "Parse Json" operation after "When a HTTP request is received". Set the values as follows;

 - Set the "Content" field to the body from the previous step.
 - Set the "Schema" field by clicking  the "Use sample payload to generate schema" link at the bottom, into this box, paste the copied value from step d. 

 ![Logic App Creation](../images/automation/LogicAppCreate7.png)

 f) From this point, you should have all the available information from your webhook, and are free to build out the logic app as required.