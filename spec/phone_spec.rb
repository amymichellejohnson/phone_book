require("rspec")
require("phone")
require("contact")

describe("Phone") do
  before() do
    Phone.clear()
  end
  describe (".all") do
    it ("is empty at first") do
      expect(Phone.all()).to(eq([]))
    end
  end

  describe("#save") do
    it ("adds a type and phone number to the array") do
      test_phone = Phone.new("Cell", 5034765356)
      test_phone.save()
      expect(Phone.all()).to(eq([test_phone]))
    end
  end

  describe(".clear") do
    it ("clears all phone types and numbers from the array") do
      Phone.new("Cell", 5034765356).save()
      Phone.clear()
      expect(Phone.all()).to(eq([]))
    end
  end

  describe("#id") do
    it ("returns unique id for each phone based on position in array") do
      test_phone = Phone.new("Cell", 5034765356).save()
      test_phone2 = Phone.new("Home", 5032222222).save()
      expect(test_phone.id()).to(eq(1))
    end
  end

  describe(".find") do
    it ("returns the phone by its id number") do
      test_phone = Phone.new("Cell", 5034765356).save()
      test_phone = Phone.new("Home", 5032222222).save()
      expect(Phone.find(test_phone.id())).to(eq(test_phone))
    end
  end
end
