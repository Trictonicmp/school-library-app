require_relative 'base_decorator'

class TrimmerDecorator < BaseDecorator
  def initialize(nameable)
    @nameable = nameable
  end

  def correct_name
    if @nameable.correct_name.length > 10
      return @nameable.correct_name[0...10]
    end

    return @nameable.correct_name
  end
end
