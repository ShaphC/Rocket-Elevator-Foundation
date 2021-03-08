
def employee
    nicolas = ['nicolas.genest@codeboxx.biz','nicolas','Genest','Nicolas','CEO']
    nadya = ['nadya.fortier@codeboxx.biz','nadya1','Fortier','Nadya','Director']
    martin = ['martin.chantal@codeboxx.biz','martin','Chantal','Martin','Director Assistant']
    mathieuH = ['mathieu.houde@codeboxx.biz','mathieu','Houde','Mathieu','Captain']
    david = ['david.boutin@codeboxx.biz','david1','Boutin','David','Engineer']
    mathieuL = ['mathieu.lortie@codeboxx.biz','mathieu','Lortie','Mathieu','Engineer']
    thomas = ['thomas.carrier@codeboxx.biz','thomas','Carrier','Thomas','Engineer']
    
    list_ = [nicolas, nadya, martin, mathieuH, david, mathieuL, thomas]
    
    for user in list_ do
        user_ = User.new
        user_.email = user[0]
        user_.password = user[1]
        user_.add_role :employee
        employee = Employee.new
        employee.last_name = user[2]
        employee.first_name = user[3]
        employee.function = user[4]
        user_.employee = employee   
        user_.save!
    end


# thomas = Employee.last
# puts(thomas)
# thomas.build_user({email: thomas.email, password: '123456', password_confirmation: '123456', employee_id:})
# puts(thomas.user)
# thomas.save
# # puts("saved")
# puts(User.all)



# # , employee_id: Employee.id
# # thomas = Employee.last
# # puts(thomas)
# # thomas.build_user({email: thomas.email, password: '123456', password_confirmation: '123456', user_id: thomas.id})
# # puts(thomas.user)
# # thomas.save
# # puts("saved")
# # puts(User.all)




# # 
# # puts(pl.sample)
# # puts(pl.sample)
# # puts(pl.sample)
# # puts(pl.sample)
# # puts(pl.sample)
# # puts(pl.sample)
# # puts(pl.sample)
# # puts(pl.sample)
# # puts(pl.sample)
# # puts(pl.sample)
# # puts(pl.sample)
# # puts(pl.sample)

# # 100.times do
# #     # dateCreationUpdate = Faker::Date.between(from: '2017-09-23', to: '2020-09-25')
# # Quote.create(
# #             install_fees: Faker::Number.between(from: 500, to: 2000),
# #             total_price: Faker::Number.between(from: 50000, to: 200000),
# #             # product_line: Faker::Number.between(from: 1, to: 3),
# #             number_of_apartments: Faker::Number.between(from: 50, to: 200),
# #             number_of_floors: Faker::Number.between(from: 10, to: 70),
# #             number_of_basements: Faker::Number.between(from: 1, to: 10),
# #             number_of_companies: Faker::Number.between(from: 1, to: 5),
# #             number_of_parking: Faker::Number.between(from: 50, to: 200),
# #             maximum_occupancy: Faker::Number.between(from: 50, to: 200),
# #             business_hours: Faker::Number.between(from: 0, to: 24),
# #             number_of_elevators: Faker::Number.between(from: 1, to: 15),
# #             unit_price: Faker::Number.between(from: 11000, to: 15000),
# #             # priceElevator: Faker::Number.between(from: 100000, to: 200000),
# #             # updated_at: dateCreationUpdate,
# #             # created_at:dateCreationUpdate
# #     )
# # end
# # # Quote.create(install_fees:23, total_price:3434, number_of_apartments:3424, number_of_floors:2312, number_of_basements:67, number_of_companies:32423)


# # product_line: Random.between(standard, Premium, Excelium ),


# # puts "### Seeding Users ###"
# # User.create!(email: 'nicolas.genest@codeboxx.biz', password: '123456')
# # User.create!(email: 'nadya.fortier@codeboxx.biz', password: '123456')
# # User.create!(email: 'martin.chantal@codeboxx.biz', password: '123456')
# # User.create!(email: 'mathieu.houde@codeboxx.biz', password: '123456')
# # User.create!(email: 'david.boutin@codeboxx.biz', password: '123456')
# # User.create!(email: 'mathieu.lortie@codeboxx.biz', password: '123456')
# # User.create!(email: 'thomas.carrier@codeboxx.biz', password: '123456')

# # puts "### Seeding Employees ###"
# # Employee.create!(firstName: 'Nicolas', lastName: 'Genest', title: "CEO", users_id: 1)
# # Employee.create!(firstName: 'Nadya', lastName: 'Fortier', title: "Director", users_id: 2)
# # Employee.create!(firstName: 'Martin', lastName: 'Chantal', title: "Director-Assistant", users_id: 3)
# # Employee.create!(firstName: 'Mathieu', lastName: 'Houde', title: "Captain", users_id: 4)
# # Employee.create!(firstName: 'David', lastName: 'Boutin', title: "Engineer", users_id: 5)
# # Employee.create!(firstName: 'Mathieu', lastName: 'Lortie', title: "Engineer", users_id: 6)
# # Employee.create!(firstName: 'Thomas', lastName: 'Carrier', title: "Engineer", users_id: 7)

# # rails g migration addUserRefToEmployees user:references


require 'faker'


# # To setup employees they must be enter manually by the site administrator 

Employee.create(first_name:"Nicolas", last_name:"genest", function:"CEO", phone:"roc-kets", email:"nicolas.genest@codeboxx.biz")
Employee.create(first_name:"Nadya", last_name:"Fortier", function:"Director", phone:"roc-kets", email:"nadya.fortier@codeboxx.biz" )
Employee.create(first_name:"Martin", last_name:"chantal", function:"Director Assistant", phone:"roc-kets", email:"martin.chantal@codeboxx.biz" )
Employee.create(first_name:"Mathieu", last_name:"Houde", function:"Captain", phone:"roc-kets", email:"mathieu.houde@codeboxx.biz" )
Employee.create(first_name:"David", last_name:"Boutin", function:"Engineer", phone:"roc-kets", email:"david.boutin@codeboxx.biz" )
Employee.create(first_name:"Mathieu", last_name:"Lortie", function:"Engineer", phone:"roc-kets", email:"mathieu.lortiet@codeboxx.biz" )
Employee.create(first_name:"Thomas", last_name:"Carrier", function:"Engineer", phone:"roc-kets", email:"thomas.carriert@codeboxx.biz" )
Employee.create(first_name:"Admin", last_name:"Admin", function:"Admin", phone:"roc-kets", email:"admin@admin.com" )
Employee.create(first_name:"Admin1", last_name:"Admin1", function:"Admin1", phone:"roc-kets", email:"admin1@admin1.com" )

# # for each employees we also create a user with acces to the admin panel 

Employee.all.each do |employee|
    user = User.new({
      email: employee.email,
      password: 123456,
      password_confirmation: 123456,
      admin: true})
    employee.user = user
    employee.save!
   end 

# # # we are supplying the client with some generate data using faker
# # # so on top of our 7 employees which are also clients we will add 13 new users who dont
# # # have access to the admin section using faker
# # # you can add a new user simply by going to the logging menu and hit sign up

13.times do
  User.create(
    email: Faker::Internet.email,
    password: 111111,
    password_confirmation: 111111
  )
end


# # Quote.create(install_fees: Faker::Date.between(from: '2017-09-23', to: '2020-09-25'),
# #             quotes_name: Faker::Name.name          
# # )
# # if you fill in the quotes form it will automatically  add it to the quotes form but we will
# # also provide you with a sample using "faker"

# 50.times do
  
#       pl = ["Standard", "Premium", "Excelium"]
#       bt = ["Residential", "Commercial", "Corporate", "Hybrid"]
#       dateCreationUpdate = Faker::Date.between(from: '2017-09-23', to: '2020-09-25')
#   Quote.create(
#               install_fees: Faker::Number.between(from: 500, to: 2000),
#               total_price: Faker::Number.between(from: 50000, to: 200000),
#               product_line: (pl.sample),
#               number_of_apartments: Faker::Number.between(from: 50, to: 200),
#               number_of_floors: Faker::Number.between(from: 10, to: 70),
#               number_of_basements: Faker::Number.between(from: 1, to: 10),
#               number_of_corporations: Faker::Number.between(from: 1, to: 100),
#               elevator_amount: Faker::Number.between(from: 1, to: 100),
#               quotes_name: Faker::Name.name,
#               quotes_email: Faker::Internet.email,
#               quotes_company_name: Faker::Company.name,
#               building_type: (bt.sample),
#               final_price: Faker::Number.between(from: 50000, to: 800000),
#               number_of_companies: Faker::Number.between(from: 1, to: 5),
#               number_of_parking: Faker::Number.between(from: 50, to: 200),
#               maximum_occupancy: Faker::Number.between(from: 50, to: 200),
#               business_hours: Faker::Number.between(from: 0, to: 24),
#               number_of_elevators: Faker::Number.between(from: 1, to: 15),
#               unit_price: Faker::Number.between(from: 11000, to: 15000),
#               # updated_at: dateCreationUpdate,
#               # created_at:dateCreationUpdate
#       )
#   end

# #   # creating addresses for each user using faker?

#   # User.all.each do |user|
#   #   address = Address.new({
#   #     type_adress: "User's address",
#   #     status: "Status",
#   #     entity: "User",                      
#   #     number_street: Faker::Address.street_address,
#   #     suite_apt: Faker::Address.secondary_address,
#   #     city: Faker::Address.city,
#   #     postal_code: Faker::Address.zip_code,
#   #     country: Faker::Address.country,
#   #   })
#   #   address.save!
#   #  end 

#   # creating addresses for each building using faker



50.times do
    status = ["Online", "Offline", "Online", "Online"]
    bt = ["Residential", "Commercial", "Corporate", "Hybrid"]
    ta = ["Billing", "Shipping", "Home", "Business"]

    Address.create(
      type_address: (ta.sample),
      status: (status.sample),
      entity: (bt.sample),
      number_street: Faker::Address.street_address,
      suite_apt: Faker::Address.secondary_address,
      city: Faker::Address.city,
      postal_code: Faker::Address.zip_code,
      country: Faker::Address.country,
      notes: Faker::Movies::BackToTheFuture.quote
       )
       
  end

50.times do
  Building.create(
      adm_contact_full_name: Faker::Name.name,
      adm_contact_email: Faker::Internet.email,
      adm_contact_phone: Faker::PhoneNumber.cell_phone,
      tech_contact_full_name: Faker::Name.name,
      tech_contact_email: Faker::Internet.email,
      tech_contact_phone: Faker::PhoneNumber.cell_phone
      # customer_id: Customer.id
      # how to add customer_id
      # how to add building_id
  )
end
50.times do
  Building_detail.create(
    value: "fhdkfhkdhfkhfk",
    info_key: "dfhkahfkhfk"
  )
end
  #     ddress_id = address.number_street
  #  Building.all.each do |building|
  #   address =

  #   address.save!
  # # end 

  # Building.create!(
  #     adm_contact_full_name: Faker::Name.name,
  #     adm_contact_email: Faker::Internet.email,
  #     adm_contact_phone: Faker::PhoneNumber.cell_phone,
  #     tech_contact_full_name: Faker::Name.name,
  #     tech_contact_email: Faker::Internet.email,
  #     tech_contact_phone: Faker::PhoneNumber.cell_phone
  #     # how to add customer_id
  #     # how to add building_id
  # # )
  # Elevator.create!(
  #     serial_number:"dfsdfdf",
  #     model:"dfsdfsdfsd",
  #     type_building:"sdfsdfsdf",
  #     status:"dfdsfsdf",
  #     # date_comissioning:,
  #     # date_last_inspection:,
  #     certificate_inspection:"dfdsfsdfsdfsdf",
  #     information:"dsfsdfsdfsdfs",
  #     notes:"fdsfsdfsf"
  #     # how to add column_id
  # )

  require 'faker'


  # # To setup employees they must be enter manually by the site administrator 
  
  Employee.create(first_name:"Nicolas", last_name:"genest", function:"CEO", phone:"roc-kets", email:"nicolas.genest@codeboxx.biz")
  Employee.create(first_name:"Nadya", last_name:"Fortier", function:"Director", phone:"roc-kets", email:"nadya.fortier@codeboxx.biz" )
  Employee.create(first_name:"Martin", last_name:"chantal", function:"Director Assistant", phone:"roc-kets", email:"martin.chantal@codeboxx.biz" )
  Employee.create(first_name:"Mathieu", last_name:"Houde", function:"Captain", phone:"roc-kets", email:"mathieu.houde@codeboxx.biz" )
  Employee.create(first_name:"David", last_name:"Boutin", function:"Engineer", phone:"roc-kets", email:"david.boutin@codeboxx.biz" )
  Employee.create(first_name:"Mathieu", last_name:"Lortie", function:"Engineer", phone:"roc-kets", email:"mathieu.lortiet@codeboxx.biz" )
  Employee.create(first_name:"Thomas", last_name:"Carrier", function:"Engineer", phone:"roc-kets", email:"thomas.carriert@codeboxx.biz" )
  Employee.create(first_name:"Admin", last_name:"Admin", function:"Admin", phone:"roc-kets", email:"admin@admin.com" )
  Employee.create(first_name:"Admin1", last_name:"Admin1", function:"Admin1", phone:"roc-kets", email:"admin1@admin1.com" )
  
  # # for each employees we also create a user with acces to the admin panel 
  
  Employee.all.each do |employee|
      user = User.new({
        email: employee.email,
        password: 123456,
        password_confirmation: 123456,
        admin: true})
      employee.user = user
      employee.save!
     end 
  
  # # # we are supplying the client with some generate data using faker
  # # # so on top of our 7 employees which are also clients we will add 13 new users who dont
  # # # have access to the admin section using faker
  # # # you can add a new user simply by going to the logging menu and hit sign up
  
  13.times do
    User.create(
      email: Faker::Internet.email,
      password: 111111,
      password_confirmation: 111111
    )
  end
  
  
  # # Quote.create(install_fees: Faker::Date.between(from: '2017-09-23', to: '2020-09-25'),
  # #             quotes_name: Faker::Name.name          
  # # )
  # # if you fill in the quotes form it will automatically  add it to the quotes form but we will
  # # also provide you with a sample using "faker"
  
  50.times do
    
        pl = ["Standard", "Premium", "Excelium"]
        bt = ["Residential", "Commercial", "Corporate", "Hybrid"]
        dateCreationUpdate = Faker::Date.between(from: '2017-09-23', to: '2020-09-25')
    Quote.create(
                install_fees: Faker::Number.between(from: 500, to: 2000),
                total_price: Faker::Number.between(from: 50000, to: 200000),
                product_line: (pl.sample),
                number_of_apartments: Faker::Number.between(from: 50, to: 200),
                number_of_floors: Faker::Number.between(from: 10, to: 70),
                number_of_basements: Faker::Number.between(from: 1, to: 10),
                number_of_corporations: Faker::Number.between(from: 1, to: 100),
                elevator_amount: Faker::Number.between(from: 1, to: 100),
                quotes_name: Faker::Name.name,
                quotes_email: Faker::Internet.email,
                quotes_company_name: Faker::Company.name,
                building_type: (bt.sample),
                final_price: Faker::Number.between(from: 50000, to: 800000),
                number_of_companies: Faker::Number.between(from: 1, to: 5),
                number_of_parking: Faker::Number.between(from: 50, to: 200),
                maximum_occupancy: Faker::Number.between(from: 50, to: 200),
                business_hours: Faker::Number.between(from: 0, to: 24),
                number_of_elevators: Faker::Number.between(from: 1, to: 15),
                unit_price: Faker::Number.between(from: 11000, to: 15000),
                # updated_at: dateCreationUpdate,
                # created_at:dateCreationUpdate
        )
    end
  
  # #   # creating addresses for each user using faker?
  
  #   # User.all.each do |user|
  #   #   address = Address.new({
  #   #     type_adress: "User's address",
  #   #     status: "Status",
  #   #     entity: "User",                      
  #   #     number_street: Faker::Address.street_address,
  #   #     suite_apt: Faker::Address.secondary_address,
  #   #     city: Faker::Address.city,
  #   #     postal_code: Faker::Address.zip_code,
  #   #     country: Faker::Address.country,
  #   #   })
  #   #   address.save!
  #   #  end 
  
  #   # creating addresses for each building using faker
  
  
  
  50.times do
      status = ["Online", "Offline", "Online", "Online"]
      bt = ["Residential", "Commercial", "Corporate", "Hybrid"]
      ta = ["Billing", "Shipping", "Home", "Business"]
  
      Address.create(
        type_address: (ta.sample),
        status: (status.sample),
        entity: (bt.sample),
        number_street: Faker::Address.street_address,
        suite_apt: Faker::Address.secondary_address,
        city: Faker::Address.city,
        postal_code: Faker::Address.zip_code,
        country: Faker::Address.country,
        notes: Faker::Movies::BackToTheFuture.quote
         )
         
    end
  
  50.times do
    Building.create(
        adm_contact_full_name: Faker::Name.name,
        adm_contact_email: Faker::Internet.email,
        adm_contact_phone: Faker::PhoneNumber.cell_phone,
        tech_contact_full_name: Faker::Name.name,
        tech_contact_email: Faker::Internet.email,
        tech_contact_phone: Faker::PhoneNumber.cell_phone
        # customer_id: Customer.id
        # how to add customer_id
        # how to add building_id
    )
  end
  50.times do
    Building_detail.create(
      value: "fhdkfhkdhfkhfk",
      info_key: "dfhkahfkhfk"
    )
  end
    #     ddress_id = address.number_street
    #  Building.all.each do |building|
    #   address =
  
    #   address.save!
    # # end 
  
    # Building.create!(
    #     adm_contact_full_name: Faker::Name.name,
    #     adm_contact_email: Faker::Internet.email,
    #     adm_contact_phone: Faker::PhoneNumber.cell_phone,
    #     tech_contact_full_name: Faker::Name.name,
    #     tech_contact_email: Faker::Internet.email,
    #     tech_contact_phone: Faker::PhoneNumber.cell_phone
    #     # how to add customer_id
    #     # how to add building_id
    # # )
    # Elevator.create!(
    #     serial_number:"dfsdfdf",
    #     model:"dfsdfsdfsd",
    #     type_building:"sdfsdfsdf",
    #     status:"dfdsfsdf",
    #     # date_comissioning:,
    #     # date_last_inspection:,
    #     certificate_inspection:"dfdsfsdfsdfsdf",
    #     information:"dsfsdfsdfsdfs",
    #     notes:"fdsfsdfsf"
    #     # how to add column_id
    # )
    #  Building.all.each do |building|
    #   address = Address.new({
    #     type_adress: "Building address",
    #     status: "Status",
    #     entity: "Building",
    #     number_street: Faker::Address.street_address,
    #     suite_apt: Faker::Address.secondary_address,
    #     city: Faker::Address.city,
    #     postal_code: Faker::Address.zip_code,
    #     country: Faker::Address.country,
    #   })
    #   building.address_id = address.number_street
    #   address.save!
    #  end 
  
    # "first_name","last_name","company_name","address","city","county","state","zip","phone1","phone2","email","web"
# , :encoding => 'ISO-8859-1'
require 'csv'
# ta = ["Billing", "Shipping", "Home", "Business"]
# to check status of address
# status = ["Online", "Offline", "Online", "Online"]
# id,address_type,status,entity,adress,appartment,city,postal_code,country,notes,created_at,updated_at

csv_text = File.read(Rails.root.join('lib','address2.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|   
    t = Address.new
    t.id = row['id']
    t.type_address = row['address_type']
    t.status = row['status']
    # entity what do you mean by that in the addresse table
    # t.entity = row['entity']
    t.number_street = row['adress']
    # t.suite_apt = row['appartment']
    t.city = row['city']
    t.postal_code = row['postal_code']
    t.country = row['country']
    t.notes = row['notes']
    t.created_at = ['created_at']
    t.updated_at = ['updated_at']
    t.save!
  end
  