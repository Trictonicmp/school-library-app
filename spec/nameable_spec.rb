require_relative '../classes/nameable.rb'

describe Nameable do
  describe "correct_name method" do
    it "should raise a NotImplementedError" do
      nameable = Nameable.new
      expect { nameable.correct_name }.to raise_error(NotImplementedError, "Not implemented yet")
    end
  end
end
