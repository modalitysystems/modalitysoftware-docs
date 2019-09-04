# Teamwork Analytics Automation Engine

## Requirements

Teamwork Analytics Automation Engine is a hosted service provided by Modality Systems.

The bot is accessed via Microsoft Teams and must be installed in your tenant before it can be used. You should have the setting "Allow external apps in Microsoft Teams" enabled to allow this to happen.

Modality Systems will provide you with the application manifest file for you to install.

Teamwork Analytics Automation Engine is an additional module which is not installed by default. For customers who wish to use Teamwork Analytics Automation Engine, Modality Systems will work with you to install a number of Azure Functions to your Azure tenant. 

Azure Functions are event-driven serverless compute functions which execute on your tenant, read the TWA database to identify who to notify, and then instruct the Modality-hosted service to send messages to your users. They typically add little or no overal cost to a Azure deployment. [Read more about pricing for Azure Functions](https://azure.microsoft.com/en-gb/pricing/details/functions/).

## Installing TWA Bot

To install the TWA Bot, a user with the Teams Service Administrator Role should select "Upload a custom app" from the Teams App Store and upload the provided manifest file. This will add the application to the Company Store and enable it to be installed by any user.

Additionally, a Teams Admin user can pin the application to the Teams menu bar using App Setup policy.
