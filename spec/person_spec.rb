require_relative '../classes/person'
require_relative '../classes/book'
require_relative '../classes/rental'
require 'date'

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

    it 'returns id of 0' do
      expect(person.id?).to eql(0)
    end

    it 'returns name "John"' do
      expect(person.correct_name).to eql('John')
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

  describe 'Many to many relationship between person and rentals' do
    person = Person.new(20, 'maximilianus', parent_permission: false)
    book = Book.new('Harry Potter', 'JK Rowling')
    rental = Rental.new(DateTime.now, book, person)
    it 'returns true if rental is in books' do
      expect(book.rentals.include?(rental)).to eql(true)
    end

    it 'returns true if rental is in person' do
      expect(person.rentals.include?(rental)).to eql(true)
    end

    book2 = Book.new('Clean Code', 'Robert C. Martin')
    rental2 = Rental.new(DateTime.now, book2, person)
    it 'expects book2 to be in books' do
      expect(book2.rentals.include?(rental2)).to eql(true)
    end

    it 'expects rental2 to be in person' do
      expect(person.rentals.include?(rental2)).to eql(true)
    end

    it 'expects both, rental1 and rental2 to be in person' do
      expect(
        person.rentals.include?(rental) &&
        person.rentals.include?(rental2)
      ).to eql(true)
    end
  end
end
