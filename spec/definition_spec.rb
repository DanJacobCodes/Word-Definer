require('rspec')
require('word')
require('definition')

describe('Definition') do
  before() do
    Definition.clear()
  end

  describe("#id") do
    it("returns the id of the defined_word") do
      test_defined_word = Definition.new({:defined_word => 'stuff that makes computer do stuff', :id => nil})
      test_defined_word.save()
      expect(test_defined_word.id()).to(eq(1))
    end
  end
  describe(".all") do
  it("tests if empty at first") do
  test_defined_word = Definition.new({:defined_word => 'stuff that makes computer do stuff', :id => nil})
    expect(Definition.all()).to(eq([]))
    end
  end
  describe("#save")do
    it('will test save method adds contents into the array') do
    test_defined_word = Definition.new({:defined_word => 'stuff that makes computer do stuff', :id => nil})
	  test_defined_word.save()
	    expect(Definition.all()).to(eq([test_defined_word]))
    end
  end
  describe(".clear")do
    it('empties out all the saved defined_words') do
    Definition.new({:defined_word => 'stuff that makes computer do stuff', :id => nil}).save()
    Definition.clear()
      expect(Definition.all()).to(eq([]))
    end
  end
  describe(".find")do
    it('returns a defined_word by its id number') do
    test_defined_word = Definition.new({:defined_word => 'stuff that makes computer do stuff', :id => nil})
    test_defined_word.save()
    test_defined_word2 = Definition.new({:defined_word => "malware", :id => nil})
    test_defined_word2.save()
    expect(Definition.find(test_defined_word.id())).to(eq(test_defined_word))
    end
  end
end
