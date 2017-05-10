require('rspec')
require('word')

describe('Word') do
  before() do
    Word.clear()
  end
  describe("#id") do
    it("returns the id of the word") do
      test_word = Word.new({:word => 'software'})
      test_word.save()
      expect(test_word.id()).to(eq(1))
    end
  end
  describe(".all") do
  it("tests if empty at first") do
  test_word = Word.new({:word=> 'software'})
    expect(Word.all()).to(eq([]))
    end
  end
  describe("#save")do
    it('will test save method adds contents into the array') do
    test_word = Word.new({:word => 'software'})
	  test_word.save()
	    expect(Word.all()).to(eq([test_word]))
    end
  end
  describe("#clear")do
    it('empties out all the saved words') do
    Word.new(:word =>"software").save()
    Word.clear()
      expect(Word.all()).to(eq([]))
    end
  end
  describe(".find")do
    it('returns a word by its id number') do
    test_word = Word.new(:word => "software")
    test_word.save()
    test_word2 = Word.new(:word => "hardware")
    test_word2.save()
    expect(Word.find(test_word.id())).to(eq(test_word))

    end
  end
end
