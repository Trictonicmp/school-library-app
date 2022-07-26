require_relative '../core/person_creator'
require_relative '../helpers/helpers'

# app/classes/menu_options/create_person.rb
class CreatePerson
  public
  def initialize(persons_list)
    @persons_list = persons_list
    @person_creator = PersonCreator.new
  end

  def create_person
    op = choose_person_type
    case op
    when 1
      new_student = @person_creator.create_student
      new_student.id = generate_new_person_id(@persons_list)
      print "Student created successfully\n\n"
      @persons_list << new_student
    when 2
      new_teacher = @person_creator.create_teacher
      new_teacher.id = generate_new_person_id(@persons_list)
      print "Teacher created successfully\n\n"
      @persons_list << new_teacher
    end
  end

  private
  def choose_person_type
    op = until_valid_option(1, 4) do
      puts 'Do you want to create'
      puts '1.- Student'
      puts '2.- Teacher'
      puts '3.- Cancel'
      puts "\n"
    end
    op
  end
end