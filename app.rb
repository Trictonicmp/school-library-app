require_relative 'classes/state_manager'
require_relative 'classes/app_manager'
require_relative 'helpers/helpers'
require 'pry'

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
    op = until_valid_option(1, 8) do
    end

    Integer(op)
  end

  def run
    while @state.app_running do
      op = show_menu
      @app_manager.goto_option(op)
    end
  end
end
