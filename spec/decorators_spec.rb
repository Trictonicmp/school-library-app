require_relative '../classes/base_decorator'
require_relative '../classes/capitalize_decorator'
require_relative '../classes/person'

describe BaseDecorator do
  describe 'correct_name method' do
    it 'returns "John" name from person class' do
      person = Person.new(20, "John", parent_permission: false)
      baseDecorator = BaseDecorator.new(person)
      expect(baseDecorator.correct_name).to eql('John')
    end
  end 
end



describe CapitalizeDecorator do
  describe 'correct_name method from person "john"' do
    person = Person.new(20, "john", parent_permission: false)
    capitalizeDecorator = CapitalizeDecorator.new(person)
    it "returns John after capitalize decorator" do
      expect(capitalizeDecorator.correct_name).to eql("John")
    end
  end
end