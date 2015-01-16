class Phone

  @@phones = []
  attr_reader(:type, :number)

  define_method(:initialize) do |type, number|
    @type = type
    @number = number
    @id = @@phones.length().+(1)
  end

  define_singleton_method(:all) do
    @@phones
  end

  define_method(:save) do
    @@phones.push(self)
    self
  end

  define_singleton_method(:clear) do
    @@phones = []
  end

  define_method(:id) do
    @id
  end

  define_singleton_method(:find) do |identification|
    found_phone = nil
    @@phones.each do |phone|
      if phone.id().eql?(identification.to_i())
        found_phone = phone
      end
    end
    found_phone
  end
end
