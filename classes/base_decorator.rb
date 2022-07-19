require_relative 'nameable'

class BaseDecorator < Nameable
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    return @nameable.correct_name
  end
end