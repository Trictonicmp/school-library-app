require_relative '../classes/capitalize_decorator'
require_relative '../classes/person'

describe CapitalizeDecorator do
  describe 'correct_name method from person "john"' do
    person = Person.new(20, "john", parent_permission: false)
    capitalizeDecorator = CapitalizeDecorator.new(person)
    it "returns John after capitalize decorator" do
      expect(capitalizeDecorator.correct_name).to eql("John")
    end
  end
end
