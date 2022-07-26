require_relative 'person_manager'
# app/classes/app_manager
class AppManager
  def initialize(state)
    @person_manager = PersonManager.new(state.persons)
  end
end