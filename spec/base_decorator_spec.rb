require_relative '../classes/base_decorator'
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
