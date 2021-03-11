# Rocket Elevators Information System <img src="app/assets/images/favicon.png" align="right" alt="Rocket Elevators logo by Maxime Auger" width="100" height="">



Application for website of the Company of Rocket Elevators
1. In this weeks requirement we were task with elevating our static site and turn it into a web application on MVC (Model - View - Controller) Ruby on Rails Application
      - create the partials for rails (Headers and Footers)
      - create the routes (see section 8.)
      - convert static .html pages to .html.rb
      - create controllers


2. Running a rails server throught linux using Ubuntu
3. Setting Database with Mysql and Postgresql ( even thought we didnt use it this week(Postgresql)) 
4. Creating Database in Mysql and linking it to the Application 
5. Setting a Back office to the site using Gems (see section 10.) and added
      - Login In in Nav bar
      - Admin page in Nav bar
      - Employees in Admin section
      - Users in Admin section
      - Quotes in Admin section


6. Using the Database with Rails
7. Accessing the admin section
8. Routes.rb
9. URL for our site http://rocketmax.xyz/
10. Gem used
11. Diagram
12. Video link

- week 4 https://youtu.be/1h2rkXGJY-c

- week 5 https://youtu.be/9A7IXR1kIfo
13. Team







1 -  Ruby on Rails to convert a static page you need to adapt it to ruby by doing
some conversion to your static page. we used this link a lot to help us out at first
https://tatyanacodes.wordpress.com/2015/07/30/static-website-to-ruby-on-rails-web-application/
We build some partials which are in charge of loading the footers and headers for all pages

![](app/assets/images/readme/partials.png)

2 - Linux terminal for windows where all the magic happens this week. Within this terminal is where you will enable your rails server like so
- type in the terminal : rails server (keep in mind for this to work you should have Ubuntu, rails, ruby, mysql and postgresql installed)

![](app/assets/images/readme/ubuntu.png)

3 - installing mysql on ubuntu  https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-18-04

4 - for creating tables in mysql with mondels
- rails g model tableName
- once the table created you need to upload them through migration
- rails db:drop
- rails db:create
- rails db:migrate
- rails db:seed ( used to populate your database if needed)

![](app/assets/images/readme/mysql.png)

5 - Ruby on rails Back office was produced using mainly 2 gems rails-admin et devise
- devise was mainly used for the signin, signup and log in
- rails-admin for the admin section the whole back office

![](app/assets/images/readme/backoffice.png)

6 - To access the database from the rails server 
- rails c
- Hirb.enable
- User.all to query the users
- exit to exit the console

![](app/assets/images/readme/railsdb.png)

7 - 📚 Instructions to acces to the admin panel:


To log as Admin:
```
1. click the log in the nav bar
2. Username:admin@admin.com
3. password: 123456
4. click on the admin button in nav bar
```
![](app/assets/images/readme/login.png)

8 - Routes is the backbone that directs the application to different pages using controllers


![](app/assets/images/readme/routes.png)

9 - you can access our live site @
https://rocketmax.xyz/

10 - Gems used <img src="https://w7.pngwing.com/pngs/96/713/png-transparent-ruby-on-rails-programming-language-rubygems-php-ruby-gem-angle-heart-logo.png" align="right" alt="Rocket Elevators logo by Maxime Auger" width="70" height="">
* gem 'devise'
      https://github.com/heartcombo/devise

* gem 'rails-admin'
      https://github.com/sferik/rails_admin/

* gem 'faker'
      https://github.com/faker-ruby/faker

* gem 'rubocop'
      https://github.com/rubocop-hq/rubocop

* gem 'sprockets-rails'
      https://github.com/rails/sprockets-rails/

* gem 'hirb'
      http://tagaholic.me/hirb/doc/index.html

      to use open  
            -open rails console in terminal
            -run : Hirb.enable ( everytime you open the console)

* gem 'cancancan'
      https://github.com/CanCanCommunity/cancancan added week 5

* gem 'pg'
      https://github.com/ged/ruby-pg added week 5

* gem 'multiverse'
      https://github.com/ankane/multiverse added week 5

* gem 'rails_admin_import', '~> 2.2'
      https://github.com/stephskardal/rails_admin_import added week 5

* gem 'chartkick'
      https://github.com/ankane/chartkick added week 5

* gem 'groupdate'
      https://github.com/ankane/groupdate added week 5

11 - The final product of our database for this week with its association represented in a Diagram (https://dbdiagram.io/)
![](app/assets/images/readme/wk4tablediagram.png)

12 - Link to our Video for week 4
https://youtu.be/1h2rkXGJY-c







# Rocket Elevators Information System <img src="app/assets/images/favicon.png" align="right" alt="Rocket Elevators logo by Maxime Auger" width="100" height="">
# Week 5


During this week, participants are exposed to a more elaborate data model and must perform basic query exercises. They will be asked to create tables, alter them and extend the concepts managed by their information system.
Two types of databases will be requested for this exercise
A relational database
A data warehouse for decision-making

1. create a link to the postgresql database
2. tables added in mysql
- address
- leads
- customers
- buildings
- building_details
- batteries
- columns
- elevators
![](app/assets/images/readme/week5_mysql_diagram.png)

3. postgresql is going to be our data warehouse for decision-making



- to connect to your postgresql DB you nees to start it with this command line: 
**sudo service postgresql start/stop/status**


![](app/assets/images/readme/postgresql.png)

4.  also to  create and migrate tables its very similar to mysql except you add  DB=nameOfDatabase: 

- **DB=dwh rails db:create**
- **DB=dwh rails db:migrate**

5. the tables created for postgres
- FactQuotes
- FactContact
- FactElevator
- DimCustomers

![](app/assets/images/readme/week5_postgresql_diagram.png)

6. updated Admin section with charts and new tables mysql and postgresql
![](app/assets/images/readme/wk5updadmin.png)
7. Rake tasks

  Rake tasks are custom build executable files that we are using to populate the postgresql database (Dwh) from our seeded data and submit data from web pages (quotes and contact us forms). Within theses task we establish a connection to our mysql DB and postgres DB, 
  
 

      (actual data to  connect is in the rake file not the read me)
This is an example of a rake task

  ``` Ruby
  desc "Import data from Quote Table to Fact Quote Table"
  task quotes: :environment do
    dwh = PG::Connection.new(host: 'localhost', port: port, dbname: "dbname", user: "user", password: "password")
    puts "lead table to fact_quote table"
    
    dwh.exec("TRUNCATE fact_quotes")

    dwh.prepare('to_fact_quotes', 'INSERT INTO fact_quotes (quote_id, creation, company_name, email, nb_elevator, created_at, updated_at) VALUES ($1, $2, $3, $4, $5, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP)')
    Quote.all.each do |quotes|
      dwh.exec_prepared('to_fact_quotes', [quotes.id, quotes.created_at, quotes.quotes_company_name, quotes.quotes_email, quotes.elevator_amount])
    end
  end 
  ```

8. File attachement in the contact us form was also added and supports all types of files. the filename can be seen in the admin section of the leads table and in the database.

9. Charts were added in the admin panel through chartskick
10. updated routes week 5

![](app/assets/images/readme/week5routes.png)

11. week 5 video link :  https://youtu.be/9A7IXR1kIfo

 






 OUR TEAM !!!!!
- Adrien Gobeil
- Charles Hall
- Eric Turcotte
- Jean-Francois Taillefer
- Maxime Auger

read me created by jean-francois taillefer


-----------------------------------------------------------------------------------------------


Week 7


ZenDesk website informations: (https://www.zendesk.com/)
  - Your Zendesk account name:  Rocket Elevators
  - Primary email: danigrum@gmail.com
  - Password: rocketelevators
  - Organization: Rocket Elevators
  - Token: zoLkKqlfJf80o8GzlAzr7F7SdXmuKGlL8desH9VY
  https://rocketelevators2021.zendesk.com/




OUR TEAM !!!!!
- Adrien Gobeil
- Daniela Grumbach Kinder
- Etienne Gonthier-Lapointe
- Maxime Auger
- Shaphan Charles















