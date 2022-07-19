require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    return @nameable.correct_name[0...10]
end
