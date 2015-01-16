require("sinatra")
require("sinatra/reloader")
require("./lib/contact")
require("./lib/phone")
also_reload('lib/**/*.rb')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

post('/contact') do
  name = params.fetch('name')
  contact = Contact.new(name)
  contact.save()
  @contacts = Contact.all()
  erb(:index)
end

post('/phone') do
  type = params.fetch('type')
  number = params.fetch('number')
  phone = Phone.new(type, number)
  phone.save()
  @foundcontact = Contact.find(params.fetch('contact_id').to_i())
  @foundcontact.add_phone(phone)
  erb(:contact)
end

get('/contact/:id') do
   @foundcontact = Contact.find(params.fetch("id").to_i())
  erb(:contact)
end

get('/clear') do
  @contacts = Contact.all()
  @contacts.clear()
  erb(:index)
end
