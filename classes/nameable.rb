class Nameable
  def correct_name
    raise NotImplementedError
  end
end

name = Nameable.new
name.correct_name