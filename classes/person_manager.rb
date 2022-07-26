require_relative 'core/person_lister'
require_relative 'core/person_creator'

# app/classes/person_manager.rb
class PersonManager
  attr_accessor :person_lister, :person_creator
  def initialize(persons_list)
    @person_lister = PersonLister.new(persons_list)
    @person_creator = PersonCreator.new
  end
end