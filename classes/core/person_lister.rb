# app/classes/core/person_lister.rb
class PersonLister
  def initialize(persons_list)
    @persons_list = persons_list
  end

  def list_persons
    @persons_list.each do |person|
      print "[#{person.class}] Name: #{person.name?}, "
      print "ID: #{person.id}, "
      print "Age: #{person.age?}\n"
    end
  end

  def list_persons_with_index
    @persons_list.each_with_index do |person, index|
      print "#{index}) ID: #{person.id}, Name: #{person.name?}, Age: #{person.age?}\n"
    end
  end
end