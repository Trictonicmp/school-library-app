class StateManager
  attr_accessor :books, :persons, :rentals
  def initialize
    @books = []
    @persons = []
    @rentals = []
  end
end
