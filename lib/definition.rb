class Definition
  @@definitions = []

  attr_accessor(:defined_word, :id)

  define_method(:initialize) do |attributes|
    @defined_word = attributes.fetch(:defined_word)
    @id = @@definitions.length().+(1)
  end

  define_method(:save) do
    @@definitions.push(self)
  end

  define_singleton_method(:all) do
    @@definitions
  end

  define_singleton_method(:clear) do
    @@definitions = []
  end

  define_singleton_method(:find) do |identification|
    found_definition = nil
    @@definitions.each() do |definition|
      if definition.id.eql?(identification)
        found_definition = definition
      end
    end
    found_definition
  end
end
