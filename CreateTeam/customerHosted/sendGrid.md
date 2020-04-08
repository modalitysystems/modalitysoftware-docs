# How to Send Email Using SendGrid with Azure

SendGrid is a cloud-based email service that provides reliable transactional email delivery, scalability, and real-time analytics along with flexible APIs that make custom integration easy. Common SendGrid use cases include:

- Automatically sending receipts or purchase confirmations to customers.
- Administering distribution lists for sending customers monthly fliers and promotions.
- Collecting real-time metrics for things like blocked email and customer engagement.
- Forwarding customer inquiries.
- Processing incoming emails.
  
For more information, visit https://sendgrid.com.

# Create a SendGrid Account

Azure customers can unlock 25,000 free emails each month. These 25,000 free monthly emails will give you access to advanced reporting and analytics and all APIs (Web, SMTP, Event, Parse, and more). For information about additional services provided by SendGrid, visit the [SendGrid Solutions](https://sendgrid.com/solutions) page.

# To sign up for a SendGrid account

1.  Sign in to the [Azure portal](https://portal.azure.com).

1. In the Azure portal menu or the home page, select **Create a resource**.
   
   ![01](../images/sendGrid/01.png)

1. Search for and select **SendGrid**.

   ![02](../images/sendGrid/02.png)

1. Complete the signup form and select **Create**.

   ![03](../images/sendGrid/03.png)

1. Enter a **Name** to identify your SendGrid service in your Azure settings. Names must be between 1 and 100 characters in length and contain only alphanumeric characters, dashes, dots, and underscores. The name must be unique in your list of subscribed Azure Store Items.

1. Enter and confirm your **Password**.

1. Choose your **Subscription**.

1. Create a new **Resource group** or use an existing one.

1. In the **Pricing tier** section select the SendGrid plan you want to sign up for.

   ![04](../images/sendGrid/04.png)

1. Enter a **Promotion Code** if you have one.

1. Enter your **Contact Information**.

1. Review and accept the **Legal terms**.

1. After confirming your purchase you will see a **Deployment Succeeded** pop-up and you will see your account listed.

   ![05](../images/sendGrid/05.png)

After you have completed your purchase and clicked the Manage button to initiate the email verification process, you will receive an email from SendGrid asking you to verify your account. If you do not receive this email, or have problems verifying your account, please see our FAQ.

   ![06](../images/sendGrid/06.png)

**You can only send up to 100 emails/day until you have verified your account.**

To modify your subscription plan or see the SendGrid contact settings, click the name of your SendGrid service to open the SendGrid Marketplace dashboard.

   ![07](../images/sendGrid/07.png)

To send an email using SendGrid, you must supply your API Key.

# To find your SendGrid API Key

1. Click Manage.

   ![08](../images/sendGrid/08.png)

1. In your SendGrid dashboard, select **Settings** and then **API Keys** in the menu on the left.

   ![09](../images/sendGrid/09.png)

1. Click the **Create API Key**.

   ![10](../images/sendGrid/10.png)

1. At a minimum, provide the **Name of this key** and provide full access to **Mail Send** and select **Save**.

   ![11](../images/sendGrid/11.png)

1. Your API will be displayed at this point one time. Please be sure to store it safely.

# To find your SendGrid credentials

1. Click the key icon to find your **Username**.

   ![12](../images/sendGrid/12.png)

1. The password is the one you chose at setup. You can select Change password or Reset password to make any changes.

To manage your email deliverability settings, click the Manage button. This will redirect to your SendGrid dashboard.

   ![13](../images/sendGrid/13.png)

  For more information on sending email through SendGrid from a custom domain, visit the [How to set up domain authentication](https://sendgrid.com/docs/ui/account-and-settings/how-to-set-up-domain-authentication) guide.

# Import CreateTeam Email Templates

1. From the SendGrid dashboard under **Email API**, click **Dynamic Templates**, **Create Dynamic Template** and call it something like **CreateTeamRequest**

   ![14](../images/sendGrid/14.png)

1. Click **Add Version**, then **Blank Templante** and then select **Design Editor**
   
   ![15](../images/sendGrid/15.png)

1. Give it a version name such as **V1**, then click **Build**, **Advanced** and then **Import Drag & Drop HTML**

   ![16](../images/sendGrid/16.png)

1. Copy and paste the code below into the Import Drag & Drop HTML screen and click **Update**

```javascript
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html data-editor-version="2" class="sg-campaigns" xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
      <!--[if !mso]><!-->
      <meta http-equiv="X-UA-Compatible" content="IE=Edge">
      <!--<![endif]-->
      <!--[if (gte mso 9)|(IE)]>
      <xml>
        <o:OfficeDocumentSettings>
          <o:AllowPNG/>
          <o:PixelsPerInch>96</o:PixelsPerInch>
        </o:OfficeDocumentSettings>
      </xml>
      <![endif]-->
      <!--[if (gte mso 9)|(IE)]>
  <style type="text/css">
    body {width: 600px;margin: 0 auto;}
    table {border-collapse: collapse;}
    table, td {mso-table-lspace: 0pt;mso-table-rspace: 0pt;}
    img {-ms-interpolation-mode: bicubic;}
  </style>
<![endif]-->
      <style type="text/css">
    body, p, div {
      font-family: arial,helvetica,sans-serif;
      font-size: 14px;
    }
    body {
      color: #000000;
    }
    body a {
      color: #1188E6;
      text-decoration: none;
    }
    p { margin: 0; padding: 0; }
    table.wrapper {
      width:100% !important;
      table-layout: fixed;
      -webkit-font-smoothing: antialiased;
      -webkit-text-size-adjust: 100%;
      -moz-text-size-adjust: 100%;
      -ms-text-size-adjust: 100%;
    }
    img.max-width {
      max-width: 100% !important;
    }
    .column.of-2 {
      width: 50%;
    }
    .column.of-3 {
      width: 33.333%;
    }
    .column.of-4 {
      width: 25%;
    }
    @media screen and (max-width:480px) {
      .preheader .rightColumnContent,
      .footer .rightColumnContent {
        text-align: left !important;
      }
      .preheader .rightColumnContent div,
      .preheader .rightColumnContent span,
      .footer .rightColumnContent div,
      .footer .rightColumnContent span {
        text-align: left !important;
      }
      .preheader .rightColumnContent,
      .preheader .leftColumnContent {
        font-size: 80% !important;
        padding: 5px 0;
      }
      table.wrapper-mobile {
        width: 100% !important;
        table-layout: fixed;
      }
      img.max-width {
        height: auto !important;
        max-width: 100% !important;
      }
      a.bulletproof-button {
        display: block !important;
        width: auto !important;
        font-size: 80%;
        padding-left: 0 !important;
        padding-right: 0 !important;
      }
      .columns {
        width: 100% !important;
      }
      .column {
        display: block !important;
        width: 100% !important;
        padding-left: 0 !important;
        padding-right: 0 !important;
        margin-left: 0 !important;
        margin-right: 0 !important;
      }
      .social-icon-column {
        display: inline-block !important;
      }
    }
  </style>
      <!--user entered Head Start-->
    
     <!--End Head user entered-->
    </head>
    <body>
      <center class="wrapper" data-link-color="#1188E6" data-body-style="font-size:14px; font-family:arial,helvetica,sans-serif; color:#000000; background-color:#464749;">
        <div class="webkit">
          <table cellpadding="0" cellspacing="0" border="0" width="100%" class="wrapper" bgcolor="#464749">
            <tr>
              <td valign="top" bgcolor="#464749" width="100%">
                <table width="100%" role="content-container" class="outer" align="center" cellpadding="0" cellspacing="0" border="0">
                  <tr>
                    <td width="100%">
                      <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                          <td>
                            <!--[if mso]>
    <center>
    <table><tr><td width="600">
  <![endif]-->
                                    <table width="100%" cellpadding="0" cellspacing="0" border="0" style="width:100%; max-width:600px;" align="center">
                                      <tr>
                                        <td role="modules-container" style="padding:0px 0px 0px 0px; color:#000000; text-align:left;" bgcolor="#ffffff" width="100%" align="left"><table class="module preheader preheader-hide" role="module" data-type="preheader" border="0" cellpadding="0" cellspacing="0" width="100%" style="display: none !important; mso-hide: all; visibility: hidden; opacity: 0; color: transparent; height: 0; width: 0;">
    <tr>
      <td role="module-content">
        <p></p>
      </td>
    </tr>
  </table><table class="wrapper" role="module" data-type="image" border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed;">
      <tr>
        <td style="font-size:6px;line-height:10px;padding:0px 0px 0px 0px;" valign="top" align="center">
          <img class="max-width" border="0" style="display:block;color:#000000;text-decoration:none;font-family:Helvetica, arial, sans-serif;font-size:16px;max-width:100% !important;width:100%;height:auto !important;" src="https://marketing-image-production.s3.amazonaws.com/uploads/8a5b6b1821009dcb276bbc8079cb3d1abf8f5bab05f5ab8896b8a037100252e26b74a5dad68c07abf122eb15f5211f5875709bb9a7e4f143796980b6aa5e1b65.png" alt="" width="600">
        </td>
      </tr>
    </table><table class="module" role="module" data-type="text" border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed;" data-mc-module-version="2019-10-22">
      <tr>
        <td style="padding:0px 40px 10px 50px;line-height:18px;text-align:justify;" height="100%" valign="top" bgcolor="">
            <div>&nbsp;</div>

<div><span style="font-family:arial,helvetica,sans-serif;">{{teamCreator}} has requested to create the following&nbsp;team:</span></div>
        </td>
      </tr>
    </table><table class="module" role="module" data-type="text" border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed;" data-mc-module-version="2019-10-22">
      <tr>
        <td style="padding:0px 50px 0px 50px;line-height:22px;text-align:inherit;" height="100%" valign="top" bgcolor="">
            <div><span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-align: justify;">&nbsp; &nbsp; Team Name: {{{team.name}}}</span></div>
        </td>
      </tr>
    </table><table class="module" role="module" data-type="text" border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed;" data-mc-module-version="2019-10-22">
      <tr>
        <td style="padding:0px 50px 0px 50px;line-height:22px;text-align:inherit;" height="100%" valign="top" bgcolor="">
            <div><span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-align: justify;">&nbsp; &nbsp; Description: {{{team.description}}}</span></div>
        </td>
      </tr>
    </table><table class="module" role="module" data-type="text" border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed;" data-mc-module-version="2019-10-22">
      <tr>
        <td style="padding:0px 50px 0px 50px;line-height:22px;text-align:inherit;" height="100%" valign="top" bgcolor="">
            <div><span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-align: justify;">&nbsp; &nbsp; Private: {{#if team.isPrivate}}Yes{{else}}No{{/if}}</span></div>
        </td>
      </tr>
    </table><table class="module" role="module" data-type="text" border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed;" data-mc-module-version="2019-10-22">
      <tr>
        <td style="padding:0px 50px 0px 50px;line-height:22px;text-align:inherit;" height="100%" valign="top" bgcolor="">
            <div><span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-align: justify;">&nbsp; &nbsp; Owners: {{#if team.owners}}&nbsp;{{#each team.owners}}&nbsp;{{this}}{{/each}}{{else}} N/A{{/if}}</span></div>
        </td>
      </tr>
    </table><table class="module" role="module" data-type="text" border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed;" data-mc-module-version="2019-10-22">
      <tr>
        <td style="padding:0px 50px 0px 50px;line-height:22px;text-align:inherit;" height="100%" valign="top" bgcolor="">
            <div><span style="color: rgb(0, 0, 0); font-family: arial, helvetica, sans-serif; font-size: 14px; font-style: normal; font-variant-ligatures: normal; font-variant-caps: normal; font-weight: 400; text-align: justify;">&nbsp; &nbsp; Members: {{#if team.members}}{{#each team.members}} {{this}}{{/each}}{{else}} N/A&nbsp;{{/if}}</span></div>
        </td>
      </tr>
    </table><table border="0" cellpadding="0" cellspacing="0" align="center" width="100%" role="module" data-type="columns" data-version="2" style="padding:10px 50px 30px 50px;box-sizing:border-box;" bgcolor="">
      <tr role="module-content">
        <td height="100%" valign="top">
            <!--[if (gte mso 9)|(IE)]>
              <center>
                <table cellpadding="0" cellspacing="0" border="0" width="100%" style="border-spacing:0;border-collapse:collapse;table-layout: fixed;" >
                  <tr>
            <![endif]-->
          
    <!--[if (gte mso 9)|(IE)]>
      <td width="490.000px" valign="top" style="padding: 0px 0px 0px 0px;border-collapse: collapse;" >
    <![endif]-->

    <table width="490.000" style="width:490.000px;border-spacing:0;border-collapse:collapse;margin:0px 5px 0px 5px;" cellpadding="0" cellspacing="0" align="left" border="0" bgcolor="" class="column column-0 of-1
                  empty">
      <tr>
        <td style="padding:0px;margin:0px;border-spacing:0;">
            
    <table class="module" role="module" data-type="text" border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed;" data-mc-module-version="2019-10-22">
      <tr>
        <td style="padding:5px 40px 8px 0px;line-height:15px;text-align:inherit;" height="100%" valign="top" bgcolor="">
            <div>Do you approve of this?</div>
        </td>
      </tr>
    </table>
  <table border="0" cellpadding="0" cellspacing="0" class="module" data-role="module-button" data-type="button" role="module" style="table-layout:fixed" width="100%"><tbody><tr><td align="left" class="outer-td" style="padding:0px 0px 5px 0px"><table border="0" cellpadding="0" cellspacing="0" class="button-css__deep-table___2OZyb wrapper-mobile" style="text-align:left"><tbody><tr><td align="center" bgcolor="#009be3" class="inner-td" style="border-radius:6px;font-size:16px;text-align:left;background-color:inherit"><a style="background-color:#009be3;border:1px solid #333333;border-color:#ffffff;border-radius:6px;border-width:1px;color:#ffffff;display:inline-block;font-family:arial,helvetica,sans-serif;font-size:14px;font-weight:normal;letter-spacing:0px;line-height:1px;padding:12px 18px 12px 18px;text-align:center;text-decoration:none" href="{{responseLink}}=true" target="_blank">Approve</a></td></tr></tbody></table></td></tr></tbody></table><table border="0" cellpadding="0" cellspacing="0" class="module" data-role="module-button" data-type="button" role="module" style="table-layout:fixed" width="100%"><tbody><tr><td align="left" class="outer-td" style="padding:0px 0px 0px 0px"><table border="0" cellpadding="0" cellspacing="0" class="button-css__deep-table___2OZyb wrapper-mobile" style="text-align:left"><tbody><tr><td align="center" bgcolor="#009be3" class="inner-td" style="border-radius:6px;font-size:16px;text-align:left;background-color:inherit"><a style="background-color:#009be3;border:1px solid #333333;border-color:#ffffff;border-radius:6px;border-width:1px;color:#ffffff;display:inline-block;font-family:arial,helvetica,sans-serif;font-size:14px;font-weight:normal;letter-spacing:0px;line-height:1px;padding:12px 18px 12px 18px;text-align:center;text-decoration:none" href="{{responseLink}}=false" target="_blank">Decline</a></td></tr></tbody></table></td></tr></tbody></table>
        </td>
      </tr>
    </table>

    <!--[if (gte mso 9)|(IE)]>
      </td>
    <![endif]-->
            <!--[if (gte mso 9)|(IE)]>
                  <tr>
                </table>
              </center>
            <![endif]-->
        </td>
      </tr>
    </table><table class="module" role="module" data-type="divider" border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed;">
      <tr>
        <td style="padding:0px 0px 0px 0px;" role="module-content" height="100%" valign="top" bgcolor="">
          <table border="0" cellpadding="0" cellspacing="0" align="center" width="100%" height="2px" style="line-height:2px; font-size:2px;">
            <tr>
              <td style="padding: 0px 0px 2px 0px;" bgcolor="#464749"></td>
            </tr>
          </table>
        </td>
      </tr>
    </table><table class="module" role="module" data-type="social" align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed;">
      <tbody>
        <tr>
          <td valign="top" style="padding:3px 50px 00px 50px;font-size:6px;line-height:10px;">
            <table align="center">
              <tbody>
                <tr>
                  <td style="padding: 0px 5px;">
        <a role="social-icon-link" href="https://www.facebook.com/modalitysystems/" target="_blank" alt="Facebook" data-nolink="false" title="Facebook " style="-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px;display:inline-block;background-color:#3B579D;">
          <img role="social-icon" alt="Facebook" title="Facebook " height="30" width="30" style="height: 30px, width: 30px" src="https://marketing-image-production.s3.amazonaws.com/social/white/facebook.png">
        </a>
      </td>
                  <td style="padding: 0px 5px;">
        <a role="social-icon-link" href=" https://twitter.com/modalitysystems" target="_blank" alt="Twitter" data-nolink="false" title="Twitter " style="-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px;display:inline-block;background-color:#7AC4F7;">
          <img role="social-icon" alt="Twitter" title="Twitter " height="30" width="30" style="height: 30px, width: 30px" src="https://marketing-image-production.s3.amazonaws.com/social/white/twitter.png">
        </a>
      </td>
                  
                  
                  
                  <td style="padding: 0px 5px;">
        <a role="social-icon-link" href="https://www.linkedin.com/company/modality-systems/" target="_blank" alt="LinkedIn" data-nolink="false" title="LinkedIn " style="-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px;display:inline-block;background-color:#0077B5;">
          <img role="social-icon" alt="LinkedIn" title="LinkedIn " height="30" width="30" style="height: 30px, width: 30px" src="https://marketing-image-production.s3.amazonaws.com/social/white/linkedin.png">
        </a>
      </td>
                </tr>
              </tbody>
            </table>
          </td>
        </tr>
      </tbody>
    </table></td>
                                      </tr>
                                    </table>
                                    <!--[if mso]>
                                  </td>
                                </tr>
                              </table>
                            </center>
                            <![endif]-->
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
      </center>
    </body>
  </html>
```
1. Click Save and then the Back Arrow

   ![17](../images/sendGrid/17.png)

1. Take Note of the **Template ID** for entry into the ARM Deployment Screen

1. Create another templete called **CreateTeamResponse**, then Copy and Paste the below in the same way as above

```javascript
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html data-editor-version="2" class="sg-campaigns" xmlns="http://www.w3.org/1999/xhtml">
    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
      <!--[if !mso]><!-->
      <meta http-equiv="X-UA-Compatible" content="IE=Edge">
      <!--<![endif]-->
      <!--[if (gte mso 9)|(IE)]>
      <xml>
        <o:OfficeDocumentSettings>
          <o:AllowPNG/>
          <o:PixelsPerInch>96</o:PixelsPerInch>
        </o:OfficeDocumentSettings>
      </xml>
      <![endif]-->
      <!--[if (gte mso 9)|(IE)]>
  <style type="text/css">
    body {width: 600px;margin: 0 auto;}
    table {border-collapse: collapse;}
    table, td {mso-table-lspace: 0pt;mso-table-rspace: 0pt;}
    img {-ms-interpolation-mode: bicubic;}
  </style>
<![endif]-->
      <style type="text/css">
    body, p, div {
      font-family: arial,helvetica,sans-serif;
      font-size: 14px;
    }
    body {
      color: #000000;
    }
    body a {
      color: #1188E6;
      text-decoration: none;
    }
    p { margin: 0; padding: 0; }
    table.wrapper {
      width:100% !important;
      table-layout: fixed;
      -webkit-font-smoothing: antialiased;
      -webkit-text-size-adjust: 100%;
      -moz-text-size-adjust: 100%;
      -ms-text-size-adjust: 100%;
    }
    img.max-width {
      max-width: 100% !important;
    }
    .column.of-2 {
      width: 50%;
    }
    .column.of-3 {
      width: 33.333%;
    }
    .column.of-4 {
      width: 25%;
    }
    @media screen and (max-width:480px) {
      .preheader .rightColumnContent,
      .footer .rightColumnContent {
        text-align: left !important;
      }
      .preheader .rightColumnContent div,
      .preheader .rightColumnContent span,
      .footer .rightColumnContent div,
      .footer .rightColumnContent span {
        text-align: left !important;
      }
      .preheader .rightColumnContent,
      .preheader .leftColumnContent {
        font-size: 80% !important;
        padding: 5px 0;
      }
      table.wrapper-mobile {
        width: 100% !important;
        table-layout: fixed;
      }
      img.max-width {
        height: auto !important;
        max-width: 100% !important;
      }
      a.bulletproof-button {
        display: block !important;
        width: auto !important;
        font-size: 80%;
        padding-left: 0 !important;
        padding-right: 0 !important;
      }
      .columns {
        width: 100% !important;
      }
      .column {
        display: block !important;
        width: 100% !important;
        padding-left: 0 !important;
        padding-right: 0 !important;
        margin-left: 0 !important;
        margin-right: 0 !important;
      }
      .social-icon-column {
        display: inline-block !important;
      }
    }
  </style>
      <!--user entered Head Start-->
    
     <!--End Head user entered-->
    </head>
    <body>
      <center class="wrapper" data-link-color="#1188E6" data-body-style="font-size:14px; font-family:arial,helvetica,sans-serif; color:#000000; background-color:#464749;">
        <div class="webkit">
          <table cellpadding="0" cellspacing="0" border="0" width="100%" class="wrapper" bgcolor="#464749">
            <tr>
              <td valign="top" bgcolor="#464749" width="100%">
                <table width="100%" role="content-container" class="outer" align="center" cellpadding="0" cellspacing="0" border="0">
                  <tr>
                    <td width="100%">
                      <table width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                          <td>
                            <!--[if mso]>
    <center>
    <table><tr><td width="600">
  <![endif]-->
                                    <table width="100%" cellpadding="0" cellspacing="0" border="0" style="width:100%; max-width:600px;" align="center">
                                      <tr>
                                        <td role="modules-container" style="padding:0px 0px 0px 0px; color:#000000; text-align:left;" bgcolor="#ffffff" width="100%" align="left"><table class="module preheader preheader-hide" role="module" data-type="preheader" border="0" cellpadding="0" cellspacing="0" width="100%" style="display: none !important; mso-hide: all; visibility: hidden; opacity: 0; color: transparent; height: 0; width: 0;">
    <tr>
      <td role="module-content">
        <p></p>
      </td>
    </tr>
  </table><table class="wrapper" role="module" data-type="image" border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed;">
      <tr>
        <td style="font-size:6px;line-height:10px;padding:0px 0px 0px 0px;" valign="top" align="center">
          <img class="max-width" border="0" style="display:block;color:#000000;text-decoration:none;font-family:Helvetica, arial, sans-serif;font-size:16px;max-width:100% !important;width:100%;height:auto !important;" src="https://marketing-image-production.s3.amazonaws.com/uploads/8a5b6b1821009dcb276bbc8079cb3d1abf8f5bab05f5ab8896b8a037100252e26b74a5dad68c07abf122eb15f5211f5875709bb9a7e4f143796980b6aa5e1b65.png" alt="" width="600">
        </td>
      </tr>
    </table><table class="module" role="module" data-type="text" border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed;" data-mc-module-version="2019-10-22">
      <tr>
        <td style="padding:5px 60px 15px 50px;line-height:18px;text-align:justify;" height="100%" valign="top" bgcolor="">
            <div>&nbsp;</div>

<div>The team "{{teamName}}" you requested to create, has been {{#if approved}} <strong>approved</strong> {{else}} <strong>declined.</strong> {{/if}}</div>
        </td>
      </tr>
    </table><table class="module" role="module" data-type="spacer" border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed;">
      <tr>
        <td style="padding:0px 0px 100px 0px;" role="module-content" bgcolor="">
        </td>
      </tr>
    </table><table class="module" role="module" data-type="divider" border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed;">
      <tr>
        <td style="padding:0px 0px 0px 0px;" role="module-content" height="100%" valign="top" bgcolor="">
          <table border="0" cellpadding="0" cellspacing="0" align="center" width="100%" height="2px" style="line-height:2px; font-size:2px;">
            <tr>
              <td style="padding: 0px 0px 2px 0px;" bgcolor="#464749"></td>
            </tr>
          </table>
        </td>
      </tr>
    </table><table class="module" role="module" data-type="social" align="center" border="0" cellpadding="0" cellspacing="0" width="100%" style="table-layout: fixed;">
      <tbody>
        <tr>
          <td valign="top" style="padding:0px 0px 0px 0px;font-size:6px;line-height:10px;">
            <table align="center">
              <tbody>
                <tr>
                  <td style="padding: 0px 5px;">
        <a role="social-icon-link" href="https://www.facebook.com/modalitysystems/" target="_blank" alt="Facebook" data-nolink="false" title="Facebook " style="-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px;display:inline-block;background-color:#3B579D;">
          <img role="social-icon" alt="Facebook" title="Facebook " height="30" width="30" style="height: 30px, width: 30px" src="https://marketing-image-production.s3.amazonaws.com/social/white/facebook.png">
        </a>
      </td>
                  <td style="padding: 0px 5px;">
        <a role="social-icon-link" href=" https://twitter.com/modalitysystems" target="_blank" alt="Twitter" data-nolink="false" title="Twitter " style="-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px;display:inline-block;background-color:#7AC4F7;">
          <img role="social-icon" alt="Twitter" title="Twitter " height="30" width="30" style="height: 30px, width: 30px" src="https://marketing-image-production.s3.amazonaws.com/social/white/twitter.png">
        </a>
      </td>
                  
                  
                  
                  <td style="padding: 0px 5px;">
        <a role="social-icon-link" href="https://www.linkedin.com/company/modality-systems/" target="_blank" alt="LinkedIn" data-nolink="false" title="LinkedIn " style="-webkit-border-radius:2px;-moz-border-radius:2px;border-radius:2px;display:inline-block;background-color:#0077B5;">
          <img role="social-icon" alt="LinkedIn" title="LinkedIn " height="30" width="30" style="height: 30px, width: 30px" src="https://marketing-image-production.s3.amazonaws.com/social/white/linkedin.png">
        </a>
      </td>
                </tr>
              </tbody>
            </table>
          </td>
        </tr>
      </tbody>
    </table></td>
                                      </tr>
                                    </table>
                                    <!--[if mso]>
                                  </td>
                                </tr>
                              </table>
                            </center>
                            <![endif]-->
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table>
              </td>
            </tr>
          </table>
        </div>
      </center>
    </body>
  </html>
  ```

## CreateTeam ARM Deployment

1. The SendGrid Email Delivery Service is now configured however.
   - Please continue to [CreateTeam ARM Deployment](armDeploy.md) for next steps.
