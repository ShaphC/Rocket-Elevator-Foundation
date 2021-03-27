<<<<<<< HEAD
# Rocket Elevators Information System <img src="app/assets/images/favicon.png" align="right" alt="Rocket Elevators logo by Maxime Auger" width="100" height="">

URL for our site http://recharles.com/


📚 Instructions to acces to the admin panel:

To log as Admin:
```
1. click the log in the nav bar
2. Username:admin@admin.com
3. password: 123456
4. click on the admin button in nav bar
```
![](app/assets/images/readme/login.png)


-----------------------------------------------------------------------------------------------
# Rocket Elevators Information System <img src="app/assets/images/favicon.png" align="right" alt="Rocket Elevators logo" width="" height="100">


## CodeBoxx Odissey - Week 8 - Consolidation

To access the Postman End Points

https://www.getpostman.com/collections/5e9b834c81ee24e4372c

-----------------------------------------------------------------------------------------------

Gems used <img src="https://w7.pngwing.com/pngs/96/713/png-transparent-ruby-on-rails-programming-language-rubygems-php-ruby-gem-angle-heart-logo.png" align="right" alt="gem image, from Ruby on Rails logo" width="70" height="">

* gem 'figaro'
      https://rubygems.org/gems/figaro/versions/1.1.1

* gem 'rails_admin_google_map'
      https://rubygems.org/gems/rails_admin_google_map

* gem 'sendgrid-ruby'
      https://rubygems.org/gems/sendgrid-ruby

* gem 'ibm_watson'
      https://rubygems.org/gems/ibm_watson

* gem "zendesk_api"
      https://rubygems.org/gems/zendesk_api

* gem 'rspotify'
      https://rubygems.org/gems/rspotify

* gem 'rack-cors'
      https://rubygems.org/gems/rack-cors

* gem 'active_model_serializers'
      https://rubygems.org/gems/active_model_serializers

* gem 'twilio-ruby'
      https://rubygems.org/gems/twilio-ruby

* gem 'slack-notifier'
      https://rubygems.org/gems/slack-notifier

* gem 'dropbox_api'
      https://rubygems.org/gems/dropbox_api

* gem "recaptcha", '~> 5.7'
      https://rubygems.org/gems/recaptcha


-----------------------------------------------------------------------------------------------

># [Google Maps](https://www.google.com/maps) <img src="app/assets/images/googleMapsLogo.png" align="right" alt="Google Maps logo" width="" height="100">

Google Maps from now on is used as an extension within our secure back office (reserved for Rocket Elevators employees) in order to geolocate our customers buildings on a map and display statistics on a location:
* Location of the Buildings
* Number of floors in the building (If the information is available)
* Client name
* Number of Batteries
* Number of Columns
* Number of Elevators
* Full name of technical contact

The geolocation page is in the Admin section of the website, available only to authenticated members.

![](app/assets/images/googleMapsBackoffice.jpg)


-----------------------------------------------------------------------------------------------
># [Twilio](https://www.twilio.com/) <img src="app/assets/images/twilioLogo.png" align="right" alt="Twilio logo" width="200" height=""> 

Twilio’s API supports virtually all forms of communication within an application and allows integration of communications between diverse experiences regardless of the platforms on which they were built.

For Rocket Elevators, Twilio can be used to allow the platform to get in touch with the technicians in case of problems.

If the status of an Elevator in the database changes to "Intervention" status, the building's technical contact must be identified and an SMS must be sent to the telephone number associated with this contact.

In this case, the designated contact will be the coach assigned to our team, David Amyot, and he will receives the alerts on his mobile phone.


-----------------------------------------------------------------------------------------------
># [Slack](https://slack.com/intl/pt-br/) <img src="app/assets/images/slackLogo.png" align="right" alt="Slack logo" width="250" height=""> 

Rocket Elevators greatly benefit from synergy between all of the company's collaborators by using the very open and flexible Slack API.

The Backoffice in particular is able to publish messages on Slack to leave written records and inform about certain events that occur through its infrastructure.

In the current use case, when a controller changes the status of an elevator, this status is reflected in the information system and persists in the operational database . When these status changes occur, a message is sent to the slack: 

**“elevator_operations” channel to leave a written record."**

The written message must have the following format:

The Elevator **[Elevator’s ID]** with Serial Number **[Serial Number]** changed status from **[Old Status]** to **[New Status]**

![](app/assets/images/slackMessages.jpg)


-----------------------------------------------------------------------------------------------
># [Dropbox](https://www.dropbox.com/) <img src="app/assets/images/dropboxLogo.png" align="right" alt="Dropbox logo" width="250" height=""> 


  Dropbox website and account informations: 
  - Webpage: https://www.dropbox.com/
  - Login: rocketelevators2@gmail.com
  - Password: Pa$$w0rd!!


Dropbox API and its online storage allows Rocket Elevators to archive their documents in the clouds in a simple and flexible way while allowing access to the file from anywhere, thanks to the multiple interfaces provided by Dropbox.

When a contact becomes a customer, that is to say when the “Customers” table in the information system can be linked to a record in the “Leads” table, which itself offers the possibility of uploading files in a binary field of the table, it is necessary to trigger an archiving procedure which: 

1. Connect to the Rocket Elevators DropBox account
2. Create a directory in DropBox on behalf of the client if the client does not already exist
3. Extract the file stored in the binary field of the MySQL database
4. Copy this file to the client DropBox directory
5. If the document is successfully downloaded to Dropbox, the controller deletes the content of the binary field from the database to avoid duplication

![](app/assets/images/dropboxResult.png)

-----------------------------------------------------------------------------------------------
># [SendGrid](https://sendgrid.com/) <img src="app/assets/images/sendgridLogo.png" align="right" alt="Sendgrid logo" width="250" height=""> 
Sendgrid
--------
__1. Gems installed__ 

`gem 'sendgrid-ruby'`
<br />
*This library allows you to quickly and easily use the Twilio SendGrid Web API v3 via Ruby.*

`gem 'figaro'`
<br />
*The gem reads a config/application.yml file and sets environment variables before anything else is configured in the Rails application.*

In your terminal, don't forget to install the gems
<br />
`bundle install`

<br />

__2. Sengrid account | Gmail account__

![](app/assets/images/readme/sendgrid_logo.png) | ![](app/assets/images/readme/gmail_logo.png)
------------ | -------------
Sendgrid website: https://sendgrid.com | Gmail website: https://www.gmail.com
Sendgrid account email: rocketelevators2@gmail.com | Gmail account email: rocketelevators2@gmail.com
Sendgrid account password: Pa$$w0rd! | Gmail account password : Pa$$w0rd!

<br />

2.a. Sendgrid image url

Upload a logo that can be used in the email

![](app/assets/images/readme/sendgrid_image.png)

<br />

2.b. Sendgrid API key

Create an API key through the website of Sendgrid

![](app/assets/images/readme/sendgrid_keypage.png)

<br />

__3. Insert the Sendgrid API key__

Create application.yml inside the /config folder and insert
`SENDGRID_API_KEY : Your_API_key`

![](app/assets/images/readme/sendgrid_API.png)

<br />

3.a. WARNING

Never upload your API key on your GitHub. To avoid this, add application.yml in .gitignore

`/config/application.yml`

![](app/assets/images/readme/sendgrid_gitignore.png)

<br />

__4. The method__ 

https://github.com/sendgrid/sendgrid-ruby

4.a. The method is coded inside the leads_controller.rb file.

```
require 'sendgrid-ruby'
include SendGrid
require 'json'

def sendgrid
      from = Email.new(email: 'rocketelevators2@gmail.com')
      subject = 'We thank you for contacting Rocket Elevators'
      to = Email.new(email: lead_params[:email])
      content = Content.new(type: 'text/html', value: 
      "<html>
            <body>
                  <p>Greetings #{lead_params[:full_name]},</p>
                  <p>We thank you for contacting Rocket Elevators to discuss the opportunity to contribute to your project #{lead_params[:project_name]}.</p>
                  <p>A representative from our team will be in touch with you very soon. We look forward to demonstrating the value of our solutions and helping you choose the appropriate product given your requirements.</p><br/>
                  <p style='color:#0b64a0;'>We’ll Talk soon,</p>
                  <p style='color:b10b1b;'>The Rocket Elevators Team</p>
                  <img src='http://cdn.mcauto-images-production.sendgrid.net/3de8595335707c70/0fb39c8b-88c6-49ed-a7a2-e44a91fb762c/140x50.png'>
                  <p>Address: 4468 Wellington St Suite 204, Verdun, Québec H4G 1W5<br/>
                  Phone: (418) 555-1234<br/>
                  Email: info@codeboxx.biz<br/>
                  This is an automated message, please do not reply</p>
                  <hr/>
            </body>
      </html>")
      mail = SendGrid::Mail.new(from, subject, to, content)
      # puts JSON.pretty_generate(mail.to_json)
      puts mail.to_json

      sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
      response = sg.client.mail._('send').post(request_body: mail.to_json)
      puts response.status_code
      puts response.body
      puts response.headers
end
```

4.b. `lead_params[:email]` `lead_params[:full=name]` `lead_params[:email]` are called from the `lead_params` method and used to personalize the email.

4.c. `sendgrid()` method is called after the `fact_contnact` method when the `@lead.save!` occure.

```
   @lead.save!
        if @lead.save
            fact_contacts()
            sendgrid()
            ...
```

<br />

__5. Fill up the 'contact us' form__

![](app/assets/images/readme/email_form.png)

<br />

__6. Email received__

![](app/assets/images/readme/email_received.png)

-----------------------------------------------------------------------------------------------
># [IBM Watson](https://www.ibm.com/watson) <img src="app/assets/images/watsonLogo.png" align="right" alt="IBM Watson logo" width="200" height=""> 

IBM through its Artificial Intelligence Watson provides application developers with many services. Among the most used, there is a Text-to-Speech functionality which can be used on a multitude of platforms.

With IBM Watson, Rocket Elevators adds text-to-speech functionality to their Home Dashboard (/ admin). Everytime the Admin Dashboard page appears, there is the option to start the briefing.

The type of information that speech synthesis allows are the following:

1. Greetings to the logged users
2. There are currently XXX elevators deployed in the XXX buildings of your XXX customers
3. Currently, XXX elevators are not in Running Status and are being serviced
4. You currently have XXX quotes awaiting processing
5. You currently have XXX leads in your contact requests
6. Batteries are deployed across XXX cities

To provide the type of voice summary described, it is necessary to execute the appropriate queries in the database to collect the relevant data. Then it forms sentences in English and combine them with the data collected.


![](app/assets/images/watsonBackoffice.jpg)



-----------------------------------------------------------------------------------------------

Bonus 1/3:
------

># [Star Wars](https://www.starwars.com/) <img src="app/assets/images/starwarsLogo.png" align="right" alt="Star Wars logo" width="" height="80"> 

Use of IBM Watson to say messages from the film Star Wars, automatically and randomly generated using the gem Faker.


![](app/assets/images/starwarsbackoffice.jpg)


-----------------------------------------------------------------------------------------------
># [ZenDesk](https://www.zendesk.com/) <img src="app/assets/images/zendeskLogo.png" align="right" alt="ZenDesk logo" width="" height="80"> 

  ZenDesk website and account informations: 
  - Webpage: https://www.zendesk.com/
  - Account name:  rocket elevators
  - Primary email: rocketelevators2@gmail.com
  - Password: Pa$$w0rd!
  - Organization: Rocket Elevators
  - Rocket Elevators ZenDesk page: https://rocketelevators3934.zendesk.com/

The ZenDesk platform can be powered by a call to the API and the software can then process requests depending on the type.

* The website's “Contact Us” form creates a new “Question” type ticket in ZenDesk
![](app/assets/images/ZenDeskContactUs1.jpg)

* The website's “Get a Quote” form creates a new “Task” type ticket in ZenDesk
![](app/assets/images/ZenDeskQuotes1.jpg)

* The tickets created are visible in the ZenDesk Console and it is possible to respond to them or even manage a workflow for these contacts.
![](app/assets/images/ZenDesk1.jpg)

The content of each ticket created must include the contact information which has been stored in the database:

Subject: **[Full Name]** from **[Company Name]**

Comment: The contact **[Full Name]** from company **[Company Name]** can be reached at email  **[E-Mail Address]** and at phone number **[Phone]**. **[Department]** has a project named **[Project Name]** which would require contribution from Rocket Elevators. 

**[Project Description]**

Attached Message: **[Message]**

The Contact uploaded an attachment


-----------------------------------------------------------------------------------------------

Bonus 2/3:
------

># [Spotify](https://www.spotify.com/us/) <img src="app/assets/images/spotifyLogo.png" align="right" alt="Spotify logo" width="" height="80"> 

Spotify API allows to listen to music when logged in on the backoffice.


![](app/assets/images/spotfybackoffice.jpg)

-----------------------------------------------------------------------------------------------

Bonus 3/3:
------

># [reCAPTCHA](https://www.google.com/recaptcha/about/) <img src="app/assets/images/recaptchaLogo.png" align="right" alt="Recaptcha logo" width="" height="80"> 

ReCAPTCHA is a service that helps protect Rocket Elevators website from spam and abuse, is a test to tell human and robots apart.

It is implemented in the Contact Us and Quote forms.

ReCAPTCHA on Contact Us form:
![](app/assets/images/recaptchaIndexPage.jpg)

ReCAPTCHA on Quote form:
![](app/assets/images/recaptchaQuoteForm.jpg)


-----------------------------------------------------------------------------------------------

























=======
# Rocket-Elevator-Foundation
>>>>>>> 1fdea2b9e2857adb22939ebdcbd7094b3da53b3f
