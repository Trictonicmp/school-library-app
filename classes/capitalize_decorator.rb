require_relative 'base_decorator'

class CapitalizeDecorator < BaseDecorator
  def initialize(nameable)
    super(nameable)
  end

  def correct_name
    return @nameable.correct_name.capitalize()
  end
end
