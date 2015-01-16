require("rspec")
require("contact")
require("phone")

describe("Contact") do

  before() do
    Contact.clear()
  end
  
  describe (".all") do
    it ("is empty at first") do
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#save") do
    it ("adds a contact to the array of contacts") do
      test_contact = Contact.new("Amy")
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe(".clear") do
    it ("clears all contacts from the array of contacts") do
      Contact.new("Amy").save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#id") do
    it ("returns unique id for each contact based on position in array") do
      test_contact = Contact.new("Amy").save()
      test_contact2 = Contact.new("Sara").save()
      expect(test_contact.id()).to(eq(1))
    end
  end

  describe(".find") do
    it ("returns the contact by its id number") do
      test_contact = Contact.new("Amy").save()
      test_contact2 = Contact.new("Sara").save()
      expect(Contact.find(test_contact.id())).to(eq(test_contact))
    end
  end

  describe("#add_phone") do
    it("adds a new phone number to a contact") do
      test_contact = Contact.new("Amy")
      test_phone = Phone.new("Cell", 50345678)
      test_contact.add_phone(test_phone)
      expect(test_contact.numbers()).to(eq([test_phone]))
    end
  end
end
