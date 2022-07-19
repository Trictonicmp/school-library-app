require_relative '../classes/base_decorator'
require_relative '../classes/capitalize_decorator'
require_relative '../classes/trimmer_decorator'
require_relative '../classes/person'

describe BaseDecorator do
  describe 'correct_name method' do
    it 'returns "John" name from person class' do
      person = Person.new(20, 'John', parent_permission: false)
      baseDecorator = BaseDecorator.new(person)
      expect(baseDecorator.correct_name).to eql('John')
    end
  end
end

describe CapitalizeDecorator do
  describe 'correct_name method from person "john"' do
    person = Person.new(20, 'john', parent_permission: false)
    capitalizeDecorator = CapitalizeDecorator.new(person)
    it 'returns John after capitalize decorator' do
      expect(capitalizeDecorator.correct_name).to eql('John')
    end
  end
end

describe TrimmerDecorator do
  describe 'correct_name method from person "Amaury Elohir"' do
    it 'returns "Amaury Elo"' do
      person = Person.new(20, 'Amaury Elohir', parent_permission: false)
      trimmerDecorator = TrimmerDecorator.new(person)
      expect(trimmerDecorator.correct_name).to eql('Amaury Elo')
    end
  end
end

describe 'Sample test from project requirements' do
  describe 'Decorators for person "maximilianus"' do
    person = Person.new(22, 'maximilianus')
    capitalizedPerson = CapitalizeDecorator.new(person)
    it 'returns Maximilianus' do
      expect(capitalizedPerson.correct_name).to eql('Maximilianus')
    end
    capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
    it 'returns "Maximilian"' do
      expect(capitalizedTrimmedPerson.correct_name).to eql('Maximilian')
    end
  end
end
