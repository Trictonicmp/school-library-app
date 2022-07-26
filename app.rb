require_relative 'classes/state_manager'
require_relative 'classes/app_manager'
require_relative 'helpers/helpers'

# app/app.rb
class App
  def initialize
    @state = StateManager.new
    @app_manager = AppManager.new(@state)

    @menu_options = [
      'List all books',
      'List all people',
      'Create a person',
      'Create a book',
      'Create a rental',
      'List all rentals for a given person id',
      'Exit'
    ]
  end

  def show_menu
    @menu_options.each_with_index do |menu_item, index|
      print "#{index + 1}.- #{menu_item}\n"
    end

    puts "\n"
    print 'Option: '
    op = gets.chomp

    Integer(op)
  end

  def run
    op = show_menu

    case op
    when 1
      list_books
    when 2
      list_persons
    when 3
      @state.persons << create_person
    when 4
      @state.books << @app_manager.book_creator.create_book
    when 5
      @state.rentals << create_rental
    when 6
      list_rentals
    else
      puts 'bye'
      exit
    end

    run
  end
end
