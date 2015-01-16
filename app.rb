require("sinatra")
require("sinatra/reloader")
require("./lib/contact")
#require("./lib/phone")
also_reload('lib/**/*.rb')

get('/') do
  @contacts = Contact.all()
  erb(:index)
end

post('/contact') do
  name = params.fetch('name')
  number = params.fetch('number')
  @contact = Contact.new({:name=>name, :number=>number})
  @contact.save()
  @contacts = Contact.all()
  erb(:index)
end

get('/contact/:id') do
   @foundcontact = Contact.find(params.fetch("id"))
  erb(:contact)
end

get('/clear') do
  @contacts = Contact.all()
  @contacts.clear()
  erb(:index)
end
