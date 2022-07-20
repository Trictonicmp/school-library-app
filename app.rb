class App
  def initialize
    @persons = []
    @books = []
    @rentals = []
  end

  def show_menu
    op = 0
    puts 'Please choose an option by entering a number'
    puts '1.- List all books'
    puts '2.- List all people'
    puts '3.- Create a person'
    puts '4.- Create a book'
    puts '5.- Create a rental'
    puts '6.- List all rentals for a given person id'
    puts '7.- Exit'
    puts "\n"
    print 'Option: '
    op = gets.chomp

    return Integer(op)
  end

  def create_student
    
  end

  def create_person
    newperson = nil
    puts 'Do you want to create'
    puts '1.- Student'
    puts '2.- Teacher'
    puts '3.- Cancel'
    puts "\n"
    
    print 'Option:'
    op = gets.chomp

    case op
    when 1
      create_student
    when 2
      create_teacher
    when 3
      return
    end
  end

  def run
    op = 0
    while op != 7
      op = show_menu

      case op
      when 1
        puts 'one'
      when 2
        puts 'two'
      when 3
        create_person
      when 4
        puts 'four'
      when 5
        puts 'five'
      when 6
        puts 'six'
      when 7
        puts 'bye'
      end
    end

  end
end

def main
  app = App.new
  app.run
end

main()
