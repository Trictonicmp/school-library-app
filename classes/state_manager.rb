# app/classes/state_manager.rb
class StateManager
  attr_reader :books
  attr_reader :persons
  attr_reader :rentals
  attr_accessor :app_running

  def initialize
    @books = []
    @persons = []
    @rentals = []
    @app_running = true
  end
end
