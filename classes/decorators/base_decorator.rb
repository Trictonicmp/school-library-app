require_relative '../nameable'

# app/classes/decorators/base_decorator.rb
class BaseDecorator < Nameable
  def initialize(nameable = nil)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end
