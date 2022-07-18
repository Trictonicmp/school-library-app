require_relative '../classes/student'

describe Student do
  describe "Constructor" do
    it "Creates a new student on classroom 4 with name \"Raul\" with age 16 and no parent_permission" do
      student = Student.new(4, 16, "Raul", parent_permission: false)
      expect(student.name?).to eql("Raul")
      expect(student.age?).to eql(16)
      expect(student.can_use_services?).to eql(false)
    end
  end

  describe "Play Hockey method" do
    student = Student.new(4, 16, "Raul", parent_permission: false)
    it "returns ¯\(ツ)/¯" do
      expect(student.play_hockey).to eql("¯\(ツ)/¯")
    end
  end
end
