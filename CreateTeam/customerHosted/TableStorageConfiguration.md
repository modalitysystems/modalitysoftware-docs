# Azure Table Storage Configuration

1. Open Azure Storage explorer on your PC (Download from https://azure.microsoft.com/en-us/features/storage-explorer/) add your PROD account and subscription if required

1. Open the storage account associated with Create Team

1. Add/Edit rows individualy, or [import the default values into table storage](ImportDefaultValuesTableStorage.md)

## Feature Table

> Default Values can be downloaded from here: [Feature.typed.csv](../images/customerHosted/Feature.typed.csv)

![Feature Table](../images/customerHosted/FeatureTableConfiguration.png "Feature Table")

Add a Feature for each of the following RowKeys:

- PartitionKey = [TenantId]
  > Note: See [whatsmytenantid.com](https://www.whatismytenantid.com/) to help find this
- RowKey = This is a unique string to identify the feature.
  - clone-teams
  - control-guest-access
  - custom-teams
  - enable-logo
  - hide-pii (Personally Identifiable Information)
  - multi-step-approval
- Enabled (boolean) = whether to enable the feature or not

> The _enable-logo_ field should only be set to _true_ after [a logo has been uploaded to your Web App Service](uploadLogoToWebApp.md).

## PeoplePicker Table

> Default Values can be downloaded from here: [PeoplePicker.typed.csv](../images/customerHosted/PeoplePicker.typed.csv)

![PeoplePicker Table](../images/customerHosted/PeoplePickerTableConfiguration.png "PeoplePicker Table")

Add a PeoplePicker for each of the following RowKeys:

- ParitionKey = [TenantId]
- RowKey = This is a unique string to identifiy the People Picker.
  - members
  - owners
  - guests
- NativeMinCount (Int32) = The minium count of people. If this number is not met, the field will invalidate the form and advise of the minimum count (red)

> For the 'owners' field, the minimum value of NativeMinCount is 1. For the other PeoplePicker fields, 'members' and 'guests', the minimum value of NativeMinCount is 0.

- RecommendedMinCount (Int32) = The recommended minimum count of people. If this number is not met, the field will advise of the recommended minimum count (yellow)
- RecommendedMaxCount (Int32) = The recommended maximum count of people. If this number is exceeded, the field will advise of the recommended maximum count (yellow)
- NativeMaxCount (Int32) = The maximum count of people. If this number is exceeded, the field will invalidate the form and advise of the maximum count (red)

> For the 'members' and 'guests' fields, the maximum value of each individual NativeMaxCount is 5000. However the combined maximum is also 5000. For example if 'members' has a value of 3000, then the maximum for 'guests' is 2000. (3000 + 2000 = 5000)

> For the 'owners' field, the maximum value of NativeMaxCount is 100.

- Validate (boolean) = This will enabled or disable the above validation rules for the People Picker.

> Please note, NativeMinCount <= RecommendedMinCount <= RecommendedMaxCount <= NativeMaxCount

> It's advisable to stick to the default native min and max counts, or, ensure the new values are more strict than the defaults. These match native teams validation.

## TextField Table

> Default Values can be downloaded from here: [TextField.typed.csv](../images/customerHosted/TextField.typed.csv)

![TextField Table](../images/customerHosted/TextFieldTableConfiguration.png "TextField Table")

Add a TextField for each of the following RowKeys:

- ParitionKey = [TenantId]
- RowKey = This is a unique string to identifiy the Text Field.
  - description
  - name
- NativeMinLength (Int32) = The minium length of input. If this number is not met, the field will invalidate the form and advise of the minimum length (red)

> For the 'name' field, the minimum value of NativeMinLength is 1.

> For the 'description' field, the minimum value of NativeMinLength is 0.

- RecommendedMinLength (Int32) = The recommended minimum length of input. If this number is not met, the field will advise of the recommended minimum length (yellow)
- RecommendedMaxLength (Int32) = The recommended maximum length of input. If this number is exceeded, the field will advise of the recommended maximum length (yellow)
- NativeMaxLength (Int32) = The maximum length of input. If this number is exceeded, the field will invalidate the form and advise of the maximum length (red).

> For the 'name' field, the maximum value of NativeMaxLength is 245. If you have suffixes defined in the Template table, see below. The NativeMaxLength for the 'name' field must be less than the maximum length (245) minus the length of the longest suffix. For example a suffix with the maximum length of 10 would require a 'name' NativeMaxLength of less than 235 (245 - 10).

> For the 'description' field, the maximum value of NativeMaxLength is 1025.

- Validate (boolean) = This will enabled or disable the above validation rules for the Text Field.

> Please note, NativeMinLength <= RecommendedMinLength <= RecommendedMaxLength <= NativeMaxLength

> It's advisable to stick to the default native min and max lengths, or, ensure the new values are more strict than the defaults. These match native teams validation.

## Approvers Table

> Default Values can be downloaded from here: [Approvers.typed.csv](../images/customerHosted/Approvers.typed.csv)

![Approvers Table](../images/customerHosted/ApproversTableConfiguration.png "Approvers Table")

If the multi-step-approval feature is enabled, the email address within this table for the tenant will be sent an email when approval is required. (This is when a user creates a team that does not meet recommended validation as per the TextField and PeoplePicker tables)

- ParitionKey = [TenantId]
- RowKey = The email address of the approver
- DisplayName = The display name of the approver. (this is only used inside table storage as a reference and is not used within the system)

## Emails Table

Ignore, this is a reserved system table and not for configuration

## Template Table

> Default Values can be downloaded from here: [Template.typed.csv](../images/customerHosted/Template.typed.csv)

![Template Table](../images/customerHosted/TemplateTableConfiguration.png "Template Table")

The templates defined in this table will appear as templates in the main menu for the tenant.

- PartitionKey = [TenantId]
- RowKey = This should be a unique Guid. To generate a Guid visit https://www.guidgenerator.com/, press the “Generate some GUIDs!” button and copy the result into this field. A new Guid needs generating for each row.
- Description = This text will appear in the summary box on the create team form when the template is selected
- Name = The name will appear in the template drop down on the main menu
- TemplateJson = The definition of the template to be created. [Learn how to configure the template JSON.](templateJsonConfiguration.md)

## CreateTeam Manifest for ARM Deployment

1. The backend deployment is now complete but for people to interact with CreateTeam you will need to create a manifest file and install into Microsoft Teams.
   - Please continue to [CreateTeam Manifest for ARM Deployment](manifestCreate.md) for next steps.
