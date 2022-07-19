require_relative 'base_decorator'

# app/classes/decorators/capitalize_decorator.rb
class CapitalizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
