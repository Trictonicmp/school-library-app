require_relative '../core/person_lister'
require_relative '../../helpers/helpers'

# app/classes/menu_options
class ListRentals
  def initialize(persons_list)
    @persons_list = persons_list
    @persons_lister = PersonLister.new(persons_list)
  end

  def list_rentals
    @persons_lister.list_persons
    print "\n"
    print 'Person ID: '
    id = Integer(gets.chomp)
    choosen_person = nil
    puts 'Rentals: '
    @persons_list.each do |person|
      choosen_person = person if person.id == id
    end
    return if choosen_person.nil?

    choosen_person.rentals.each do |rental|
      print "Date: #{rental.date}, "
      print "Book: #{rental.book.title}, "
      print "Person: #{rental.person.name?}\n"
    end
    print "\n\n"
  end
end