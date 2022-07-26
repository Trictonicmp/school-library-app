require_relative '../classes/decorators/base_decorator'
require_relative '../classes/decorators/capitalize_decorator'
require_relative '../classes/decorators/trimmer_decorator'
require_relative '../classes/core/person'

describe BaseDecorator do
  describe 'correct_name method' do
    it 'returns "John" name from person class' do
      person = Person.new(20, 'John', parent_permission: false)
      base_decorator = BaseDecorator.new(person)
      expect(base_decorator.correct_name).to eql('John')
    end
  end
end

describe CapitalizeDecorator do
  describe 'correct_name method from person "john"' do
    person = Person.new(20, 'john', parent_permission: false)
    capitalize_decorator = CapitalizeDecorator.new(person)
    it 'returns John after capitalize decorator' do
      expect(capitalize_decorator.correct_name).to eql('John')
    end
  end
end

describe TrimmerDecorator do
  describe 'correct_name method from person "Amaury Elohir"' do
    it 'returns "Amaury Elo"' do
      person = Person.new(20, 'Amaury Elohir', parent_permission: false)
      trimmer_decorator = TrimmerDecorator.new(person)
      expect(trimmer_decorator.correct_name).to eql('Amaury Elo')
    end
  end
end

describe 'Sample test from project requirements' do
  describe 'Decorators for person "maximilianus"' do
    person = Person.new(22, 'maximilianus')
    capitalized_person = CapitalizeDecorator.new(person)
    it 'returns Maximilianus' do
      expect(capitalized_person.correct_name).to eql('Maximilianus')
    end
    capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
    it 'returns "Maximilian"' do
      expect(capitalized_trimmed_person.correct_name).to eql('Maximilian')
    end
  end
end
