require_relative '../classes/person'

describe Person do
  describe 'Constructor' do
    it 'Creates a new person with name "John" with age 20 and no parent_permission' do
      person = Person.new(20, 'John', parent_permission: false)
      expect(person.name?).to eql('John')
      expect(person.age?).to eql(20)
      expect(person.can_use_services?).to eql(true)
    end
  end

  describe 'Getters and Setters' do
    person = Person.new(20, 'John', parent_permission: false)

    it 'returns name of "John"' do
      expect(person.name?).to eql('John')
    end

    it 'returns age of 20' do
      expect(person.age?).to eql(20)
    end

    it "sets person's name to \"Raul\"" do
      person.name('Raul')
      expect(person.name?).to eql('Raul')
    end

    it "sets person's age to 16" do
      person.age(16)
      expect(person.age?).to eql(16)
    end
  end

  describe 'Can Use Services' do
    person = Person.new(20, 'John', parent_permission: false)

    it 'returns true due to age 20 and parent_permission false' do
      expect(person.can_use_services?).to eql(true)
    end

    person2 = Person.new(16, 'John', parent_permission: false)
    it 'returns false due to age 16 and parent permission true' do
      expect(person2.can_use_services?).to eql(false)
    end

    person3 = Person.new(16, 'John', parent_permission: true)
    it 'returns true due to age 16 and parent_permission true' do
      expect(person3.can_use_services?).to eql(true)
    end
  end
end
