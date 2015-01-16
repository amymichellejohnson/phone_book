require("rspec")
require("contact")

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
      test_contact = Contact.new({:name=>"Amy", :number=>"5034765356"})
      test_contact.save()
      expect(Contact.all()).to(eq([test_contact]))
    end
  end

  describe(".clear") do
    it ("clears all contacts from the array of contacts") do
      Contact.new({:name=>"Amy", :number=>"5034765356"}).save()
      Contact.clear()
      expect(Contact.all()).to(eq([]))
    end
  end

  describe("#id") do
    it ("returns unique id for each contact based on position in array") do
      test_contact = Contact.new({:name=>"Amy", :number=>"5034765356"}).save()
      test_contact2 = Contact.new({:name=>"Sara", :number=>"5032222222"}).save()
      expect(test_contact.id()).to(eq(1))
    end
  end

  describe(".find") do
    it ("returns the contact by its id number") do
      test_contact = Contact.new({:name=>"Amy", :number=>"5034765356"}).save()
      test_contact2 = Contact.new({:name=>"Sara", :number=>"5032222222"}).save()
      expect(Contact.find(test_contact.id())).to(eq(test_contact))
    end
  end

end
