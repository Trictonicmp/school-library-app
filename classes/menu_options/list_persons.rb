require_relative '../core/person_lister'

# app/classes/menu_options/list_persons.rb
class ListPersons
  def initialize(persons_list)
    @persons_list = persons_list
    @person_lister = PersonLister.new(persons_list)
  end

  def list_persons
    if @persons_list.empty?
      print "There are no persons\n\n"
      return
    end
    puts 'Persons list'
    @person_lister.list_persons
    print "\n" 
  end
end