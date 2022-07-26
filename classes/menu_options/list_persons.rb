require_relative 'person_lister'
# app/classes/menu_options/list_persons.rb

class ListPersons
  def initialize(state)
    @persons_list = state.persons
    @person_lister = PersonLister.new(state.persons)
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